CLASS zcl_car_status_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS ZCL_CAR_STATUS_FILL IMPLEMENTATION.


    METHOD if_oo_adt_classrun~main.
        DATA itab TYPE TABLE OF zcar_status_t.

        itab = VALUE #(
            ( status_code = 'A' status_text = 'Available' )
            ( status_code = 'R' status_text = 'Reserved' )
            ( status_code = 'S' status_text = 'Sold' )
        ).

        DELETE FROM zcar_status_t.
        INSERT zcar_status_t FROM TABLE @itab.
    ENDMETHOD.
ENDCLASS.
