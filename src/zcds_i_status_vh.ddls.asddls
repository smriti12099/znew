@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VALUE HELP CDS VIEW Status'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@ObjectModel.resultSet.sizeCategory: #XS // To Convert Selection Field to Drop Box Button add this annotations in each Used CDS view
define view entity zcds_i_Status_VH as select from ztab_status
{

    key status as Status,
   status_description as StatusDescription
    //lang as Lang
}
