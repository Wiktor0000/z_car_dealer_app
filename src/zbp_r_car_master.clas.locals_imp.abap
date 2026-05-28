TYPES: BEGIN OF ty_api_result,
         value    TYPE string,
         variable TYPE string,
       END OF ty_api_result.

TYPES: BEGIN OF ty_nhtsa_response,
         count   TYPE i,
         results TYPE STANDARD TABLE OF ty_api_result WITH DEFAULT KEY,
       END OF ty_nhtsa_response.


CLASS lcl_handler DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR Car RESULT result.

    METHODS decodeVin FOR MODIFY
      IMPORTING keys FOR ACTION Car~decodeVin RESULT result.
ENDCLASS.


CLASS lcl_handler IMPLEMENTATION.

  METHOD get_global_authorizations.
    RETURN.
  ENDMETHOD.

  METHOD decodeVin.
    DATA: lv_brand TYPE string,
          lv_model TYPE string,
          lv_year  TYPE string.


    READ ENTITIES OF zr_car_master IN LOCAL MODE
      ENTITY Car
        FIELDS ( Vin ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_cars).

    LOOP AT lt_cars ASSIGNING FIELD-SYMBOL(<ls_car>).
      IF <ls_car>-Vin IS INITIAL.
        CONTINUE.
      ENDIF.


      DATA(lv_url) = |https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVin/{ <ls_car>-Vin }?format=json|.

      TRY.
          DATA(lo_http_client) = cl_web_http_client_manager=>create_by_http_destination(
                                   cl_http_destination_provider=>create_by_url( lv_url ) ).

          DATA(lo_response) = lo_http_client->execute( i_method = if_web_http_client=>get ).
          DATA(lv_json_res) = lo_response->get_text( ).

          DATA(ls_api_data) = VALUE ty_nhtsa_response( ).
          /ui2/cl_json=>deserialize(
            EXPORTING
              json = lv_json_res
            CHANGING
              data = ls_api_data ).

          LOOP AT ls_api_data-results INTO DATA(ls_row).
            CASE ls_row-variable.
              WHEN 'Make'.       lv_brand = ls_row-value.
              WHEN 'Model'.      lv_model = ls_row-value.
              WHEN 'Model Year'. lv_year  = ls_row-value.
            ENDCASE.
          ENDLOOP.

DATA: lv_sap_date TYPE d.
IF lv_year IS NOT INITIAL.
  lv_sap_date = |{ lv_year }0101|.
ENDIF.

MODIFY ENTITIES OF zr_car_master IN LOCAL MODE
  ENTITY Car
    UPDATE FIELDS ( Brand Model YearOfProduction )
    WITH VALUE #( ( %tky             = <ls_car>-%tky
                    Brand            = lv_brand
                    Model            = lv_model
                    YearOfProduction = lv_sap_date ) )
  REPORTED DATA(ls_reported).


          APPEND VALUE #( %tky   = <ls_car>-%tky
                          %param = <ls_car> ) TO result.

        CATCH cx_root.
          CONTINUE.
      ENDTRY.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
