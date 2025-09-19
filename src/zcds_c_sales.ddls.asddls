@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption CDS View Sales'
//@Metadata.allowExtensions: true


define root view entity ZCDS_C_SALES
  provider contract transactional_query
  as projection on zcds_sales
  {
  

key Salesdocument,
SalesAmount,
@Semantics.currencyCode: true
SalesCurrency,
Customer,
CustomerName,
Status,
ispermitted
   
}
