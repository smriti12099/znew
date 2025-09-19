@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds View Sales Order'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
@ObjectModel.semanticKey: [ 'SalesDocument' ] // to bold the content
//@UI.headerInfo : { typeNamePlural: 'AppUK'}// To show the Number of Lines on Table Header
@Search.searchable: true //To add new input That is Search button

@UI.headerInfo:  { typeName: 'App for Sale',
                typeNamePlural: 'Apps for Sales' ,
                title: { type: #STANDARD ,value: 'CustomerName'},
                description: { value: 'Customer'}
                } 
// Above Annotation for to Show Header of table view , not on Single Object Page 
//These two line //typeName: 'App for Sale',
                 //typeNamePlural: 'Apps for Sales' ,               
// And another two line means on a Single Object Page, it shows Customer Name & No.
//  title: { type: #STANDARD ,value: 'CustomerName'},
//  description: { value: 'Customer'}

define root view entity zcds_sales as select from ztab_sales
association to ztab_status as Status_Table on  $projection.Status = Status_Table.status
association to ZCDS_I_STATUS_IMG as IMG on $projection.Status = IMG.Status
{

// To Show UI Facet as Header on Top of Object Page Data Comes From Data Point & Title also
@UI.facet: [{ 
            id: 'Sales_Currency',
            purpose: #HEADER,
            type: #DATAPOINT_REFERENCE,
            position: 10,
            targetQualifier: 'SalesCurrency'
         },
         {
         id: 'Status',
         type: #DATAPOINT_REFERENCE,
         purpose: #HEADER,
         position: 20,
         targetQualifier: 'Status'
         },
         
         // To Make Section on Object Page  which hold collection kind to field
         {
         label : 'General Informations',
         id: 'GeneralInfo',
         type: #COLLECTION,
         position: 10
         },
         // To make a area in General Informations Section where some field(normal) can show using @UI.Identifaction Annptations
         {
            id: 'Sales',
            label: 'General Sales',
            type: #IDENTIFICATION_REFERENCE,
            parentId: 'GeneralInfo',
            position: 10
         },
         // To make a area in General Informations Section where some field(field group) can show using @UI.FieldGroup Annptations
         {
            id: 'Customer',
            label: 'Gen. Customer',
            type: #FIELDGROUP_REFERENCE,
            parentId: 'GeneralInfo',
            position: 20,
            targetQualifier: 'CustGrp'
         },
         // To make a area in General Informations Section where some field(field group) can show using @UI.FieldGroup Annptations
         {
            id: 'Status',
            label: 'Gen. Status',
            type: #FIELDGROUP_REFERENCE,
            parentId: 'GeneralInfo',
            position: 30,
            targetQualifier: 'StatusGrp'
         }
         ]




@UI.lineItem: [{ position: 10, label: 'Sales Document' }]
 @UI.selectionField: [{ position: 15 }]
@Consumption.filter:{selectionType: #INTERVAL,  multipleSelections: false} //For multiple Input
@UI.identification: [{ position: 10, label: 'Sales Num' }] // To show Field on Object Page Main Side automatically Indentification Refernce Type
key salesdocument as SalesDocument,
  @UI.selectionField: [{ position: 20 }]
  @UI.lineItem:       [{ position: 20, label: 'Sales Amount' }]
sales_amount as SalesAmount,

@Consumption.filter:{selectionType: #INTERVAL,  multipleSelections: false} //For multiple Input
 @UI.selectionField: [{ position: 25 }]
  @UI.lineItem:       [{ position: 25, label: 'Order Date' }]
  @UI.identification: [{ position: 20, label: 'Sales Order date' }] // To show Field on Object Page Main Side automatically Indentification Refernce Type
orderdate,

  @UI.selectionField: [{ position: 30 }]
  @UI.lineItem:       [{ position: 30, label: 'Sales Currency' }]
  @UI.dataPoint:{ qualifier: 'SalesCurrency' , title : 'Currency'}// To pass the Value through Data Point & DataRefernces
sales_currency as SalesCurrency,

@ObjectModel.text.element: [ 'CustomerName' ] // To show along with description
//@UI.textArrangement: #TEXT_ONLY // Now if you want to show only Description
 @UI.lineItem:       [{ position: 40, label: 'Customer' }]
 @UI.fieldGroup: [{ position: 10,qualifier: 'CustGrp' }] // To show Field on Object Page FieldGrp Ref. Type name : CustGrp
customer as Customer,

@Search.defaultSearchElement: true // It allow in general Search input
@Search.fuzzinessThreshold: 0.8  // It work as a 80% Accuracy
  @UI.selectionField: [{ position: 50 }]
  @UI.lineItem:       [{ position: 50, label: 'Customer Name' }]
@UI.fieldGroup: [{ position: 20,qualifier: 'CustGrp' }] // To show Field on Object Page FieldGrp Ref. Type name : CustGrp
customer_name as CustomerName,

  @Consumption.valueHelpDefinition: [{ entity : {name: 'ZCDS_I_STATUS_VH' , element: 'Status'} }] // For valueHelp
  @UI.selectionField: [{ position: 60 }]
  @UI.lineItem:       [{ position: 60, label: 'Status' , criticality: 'ColorStatus'}] // To show with Color
  @ObjectModel.text.element: [ 'StatusDescription' ] // To show along with description
//@UI.textArrangement: #TEXT_ONLY // Now if you want to show only Description

//@Consumption.filter.mandatory: true // Its mandatory Field
  @UI.dataPoint:{ qualifier: 'Status', title : 'Status', criticality: 'ColorStatus'}// To pass the Value through Data Point & DataRefernces
@UI.fieldGroup: [{ position: 10,qualifier: 'StatusGrp', criticality: 'ColorStatus'}] // To show Field on Object Page FieldGrp Ref. Type name : StatusGrp
status as Status,

case status
when 'O' then 2
when 'A' then 3
when 'R' then 1
else 0 
end as ColorStatus,


@UI.selectionField: [{ position: 65 }]
  @UI.lineItem:       [{ position: 65, label: 'ICON' }]
@Semantics.imageUrl: true
IMG.StatusImage,


 @UI.selectionField: [{ position: 70 }]
  @UI.lineItem:       [{ position: 70, label: 'Permission' },
   {type: #FOR_ACTION , label: 'Permission' ,dataAction: 'Permission'}
  
  ]
  
  @UI.fieldGroup: [{ position: 20,qualifier: 'StatusGrp' }] // To show Field on Object Page FieldGrp Ref. Type name : StatusGrp
 ispermitted,


 @UI.selectionField: [{ position: 80 }]
  @UI.lineItem:       [{ position: 80, label: 'Status Description' }]
  @UI.hidden: true
Status_Table.status_description as StatusDescription

}

//key salesdocument as Salesdocument,
//sales_amount as SalesAmount,
//sales_currency as SalesCurrency,
//customer as Customer,
//customer_name as CustomerName
