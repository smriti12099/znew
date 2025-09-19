CLASS zcl_test_i_address_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_i_address_2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
   select * from I_Address_2 with PRIVILEGED ACCESS

 WHERE AddressID = '0000000044'
  into table @data(lt).
     out->write( 'Done' ).
     out->write( lt ).
  ENDMETHOD.
ENDCLASS.
