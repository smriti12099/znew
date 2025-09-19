CLASS zcl_sales DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SALES IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  data : gt_sales TYPE STANDARD TABLE OF ztab_sales.

   DELETE FROM ztab_sales.

    gt_sales = VALUE #(
( Salesdocument = '1000000001' Customer = '100001' customer_name = 'Rashid' sales_amount = '1500.30' sales_currency = 'INR' status = 'A' orderdate = '20250101' )
( Salesdocument = '1000000002' Customer = '100002' customer_name = 'Ayesha' sales_amount = '2400.60' sales_currency = 'INR' status = 'R' orderdate = '20250102' )
( Salesdocument = '1000000003' Customer = '100003' customer_name = 'Vikram' sales_amount = '3200.90' sales_currency = 'INR' status = 'A' orderdate = '20250103' )
( Salesdocument = '1000000004' Customer = '100004' customer_name = 'Priya' sales_amount = '1800.50' sales_currency = 'INR' status = 'O' orderdate = '20250104' )
( Salesdocument = '1000000005' Customer = '100005' customer_name = 'Zahid' sales_amount = '2750.00' sales_currency = 'INR' status = 'A' orderdate = '20250105' )
( Salesdocument = '1000000006' Customer = '100006' customer_name = 'Meera' sales_amount = '3050.25' sales_currency = 'INR' status = 'R' orderdate = '20250106' )
( Salesdocument = '1000000007' Customer = '100007' customer_name = 'Sanjay' sales_amount = '1500.00' sales_currency = 'INR' status = 'O' orderdate = '20250107' )
( Salesdocument = '1000000008' Customer = '100008' customer_name = 'Anjali' sales_amount = '1980.00' sales_currency = 'INR' status = 'A' orderdate = '20250108' )
( Salesdocument = '1000000009' Customer = '100009' customer_name = 'Ravi' sales_amount = '2150.75' sales_currency = 'INR' status = 'R' orderdate = '20250109' )
( Salesdocument = '1000000010' Customer = '100010' customer_name = 'Farah' sales_amount = '1600.00' sales_currency = 'INR' status = 'O' orderdate = '20250110' )
( Salesdocument = '1000000011' Customer = '100011' customer_name = 'Rohan' sales_amount = '3600.00' sales_currency = 'INR' status = 'A' orderdate = '20250111' )
( Salesdocument = '1000000012' Customer = '100012' customer_name = 'Kiran' sales_amount = '2900.40' sales_currency = 'INR' status = 'O' orderdate = '20250112' )
( Salesdocument = '1000000013' Customer = '100013' customer_name = 'Fatima' sales_amount = '1700.00' sales_currency = 'INR' status = 'A' orderdate = '20250113' )
( Salesdocument = '1000000014' Customer = '100014' customer_name = 'Neeraj' sales_amount = '2555.55' sales_currency = 'INR' status = 'R' orderdate = '20250114' )
( Salesdocument = '1000000015' Customer = '100015' customer_name = 'Sneha' sales_amount = '1400.00' sales_currency = 'INR' status = 'O' orderdate = '20250115' )
( Salesdocument = '1000000016' Customer = '100016' customer_name = 'Tariq' sales_amount = '2750.00' sales_currency = 'INR' status = 'R' orderdate = '20250116' )
( Salesdocument = '1000000017' Customer = '100017' customer_name = 'Divya' sales_amount = '3250.80' sales_currency = 'INR' status = 'A' orderdate = '20250117' )
( Salesdocument = '1000000018' Customer = '100018' customer_name = 'Sameer' sales_amount = '1800.00' sales_currency = 'INR' status = 'O' orderdate = '20250118' )
( Salesdocument = '1000000019' Customer = '100019' customer_name = 'Pooja' sales_amount = '2100.00' sales_currency = 'INR' status = 'R' orderdate = '20250119' )
( Salesdocument = '1000000020' Customer = '100020' customer_name = 'Amit' sales_amount = '2300.00' sales_currency = 'INR' status = 'A' orderdate = '20250120' )
  ).

    INSERT ztab_sales FROM TABLE @gt_sales.
    out->write( 'Sales data is inserted' ).

    data : gt_status TYPE TABLE of ztab_status.
    DELETE FROM ztab_status.

    gt_status = Value #(

    ( status = 'A' status_description = 'Accepted' lang = 'EN' )
    ( status = 'O' status_description = 'Open' lang = 'EN' )
    ( status = 'R' status_description = 'Rejected' lang = 'EN' )
     ).

     INSERT ztab_status FROM TABLE @gt_status.
     out->write( 'Status Table Filled' ).


      data : gt_status_image TYPE TABLE of ztab_status_img.
    DELETE FROM ztab_status_img.

    gt_status_image = Value #(

    ( status = 'A' status_description = 'Accepted'  status_image = 'https://tse4.mm.bing.net/th/id/OIP.BxHfDa2B_NuB_9IT8DLYywHaHa?w=720&h=720&rs=1&pid=ImgDetMain&o=7&rm=3')
    ( status = 'O' status_description = 'Open' status_image = 'https://illustoon.com/photo/7274.png')
    ( status = 'R' status_description = 'Rejected' status_image = 'https://toppng.com/uploads/preview/red-circle-1155276042606ekqvli9k.png' )
     ).

     INSERT ztab_status_img FROM TABLE @gt_status_image.
     out->write( 'Status Images Table Filled' ).

  ENDMETHOD.
ENDCLASS.
