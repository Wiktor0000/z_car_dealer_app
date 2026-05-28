CLASS zcl_car_body_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.



CLASS zcl_car_body_fill IMPLEMENTATION.

    METHOD if_oo_adt_classrun~main.
    DATA body TYPE TABLE OF zcar_body_t.

    body = VALUE #(
        ( body_code = 'SUV' body_text = 'Suv' )
        ( body_code = 'SED' body_text = 'Sedan' )
        ( body_code = 'COM' body_text = 'Combi' )
    ).
    DELETE FROM zcar_body_t.
    INSERT zcar_body_t FROM TABLE @body.
    ENDMETHOD.
ENDCLASS.
