CLASS zcl_test_billdoc_cube_cds DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_billdoc_cube_cds IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

 select

 a~BillingDocument,
 a~BillingDocumentItem,
 a~BillingDocumentDate,
 a~BillingDocumentType,
 b~BillingDocumentTypeName

  from I_BillingDocumentItemCube( p_exchangeratetype = 'M', p_displaycurrency = 'INR' ) with PRIVILEGED ACCESS as a
  left OUTER JOIN I_BillingDocumentTypeText with PRIVILEGED ACCESS  as b on a~BillingDocumentType = b~BillingDocumentType
 into table @data(lt).


" where on  BillingDocumentType not in ( 'F5', 'F8' , JSN )
     out->write( 'Done' ).

 out->write( lt ).

  ENDMETHOD.
ENDCLASS.
