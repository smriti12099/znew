CLASS ztest_stxh_tab_resd_text DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ztest_stxh_tab_resd_text IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

   "select * from STXH with PRIVILEGED ACCESS
* "into table @data(lt).
  "   out->write( 'Done' ).
  ENDMETHOD.
ENDCLASS.
