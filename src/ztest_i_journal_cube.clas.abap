CLASS ztest_i_journal_cube DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZTEST_I_JOURNAL_CUBE IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
 select * from I_JOURNALENTRYITEM with PRIVILEGED ACCESS
 into table @data(lt).
     out->write( 'Done' ).



  ENDMETHOD.
ENDCLASS.
