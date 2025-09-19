CLASS lhc_sales DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR sales RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR sales RESULT result.

    METHODS permission FOR MODIFY
      IMPORTING keys FOR ACTION sales~permission RESULT result.

ENDCLASS.

CLASS lhc_sales IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD permission.
  ENDMETHOD.

ENDCLASS.
