-- viewing selected table

select * from customer;

select * from date;

select * from geography;

select * from internetsales;

select * from product;

select * from productcategory;

select * from productsubcategory;

alter user postgres with password '12345678';

-- creating table joining productcategory and productsubcategory

select b.productcategoryalternatekey , b.englishproductcategoryname , a.productsubcategorykey , a.productsubcategoryalternatekey , a.englishproductsubcategoryname ,
a.productcategorykey 
from productsubcategory as a join productcategory as b 
on a.productcategorykey=b.productcategorykey;

create table  product_cat_subcat as select b.productcategoryalternatekey , b.englishproductcategoryname , a.productsubcategorykey , a.productsubcategoryalternatekey , a.englishproductsubcategoryname ,
a.productcategorykey 
from productsubcategory as a join productcategory as b 
on a.productcategorykey=b.productcategorykey;

select * from product_cat_subcat;

-- joining table product product_cat_subcat and product

select a.productkey,a.productalternatekey,a.productsubcategorykey,a.englishproductname,a.color,a.safetystocklevel,a.reorderpoint,a.size,a.daystomanufacture,a.productline,a.modelname,a.englishdescription,
b.productcategoryalternatekey,b.englishproductcategoryname,b.productcategoryalternatekey,b.englishproductsubcategoryname,b.productcategorykey
from product as a join  product_cat_subcat as b
on a.productsubcategorykey = b.productsubcategorykey;

create table product_detail as select a.productkey,a.productalternatekey,a.productsubcategorykey,a.englishproductname,a.color,a.safetystocklevel,a.reorderpoint,a.size,a.daystomanufacture,a.productline,a.modelname,a.englishdescription,
b.englishproductcategoryname,b.productcategoryalternatekey,b.englishproductsubcategoryname,b.productcategorykey
from product as a join  product_cat_subcat as b
on a.productsubcategorykey = b.productsubcategorykey;

select * from product_detail;

-- deleting unnessisary data of customer table



alter table customer
drop column numberchildrenathome,
drop column frencheducation,
drop column spanishoccupation,
drop column totalchildren,
drop column numbercarsowned,
drop column englishoccupation,
drop column phone,
drop column title,
drop column namestyle,
drop column birthdate,
drop column maritalstatus,
drop column suffix,
drop column yearlyincome,
drop column spanisheducation,
drop column frenchoccupation,
drop column houseownerflag,
drop column  addressline2;


-------date table unrelavant data delete

alter table date
drop column daynumberofweek,
drop column englishdaynameofweek,
drop column spanishdaynameofweek,
drop column frenchdaynameofweek,
drop column daynumberofmonth,
drop column daynumberofyear,
drop column weeknumberofyear,
drop column englishmonthname,
drop column spanishmonthname,
drop column frenchmonthname,
drop column monthnumberofyear,
drop column calendarsemester,
drop column fiscalquarter,
drop column fiscalyear,
drop column fiscalsemester;

---removing from geography

select * from geography;

alter table geography
drop column spanishcountryregionname,
drop column frenchcountryregionname;

--- removing from internetsales

create table internsales2 as select * from internetsales;

alter table internetsales
drop column duedatekey,
drop column  promotionkey,
drop column currencykey;

---removing from product and productsubcateogery

select * from product_detail;

alter table product_detail
drop column productsubcategorykey,
drop column safetystocklevel,
drop column reorderpoint,
drop column size,
drop column daystomanufacture,
drop column productline,
drop column englishdescription,
drop column productcategoryalternatekey;

----joining customer and geography table

select  case when not middlename='NULL' then firstname ||' '|| middlename ||' '|| lastname else firstname ||' '|| lastname end    as cuatomer_name
from customer

select a.customerkey,a.geographykey,a.customeralternatekey,case when not middlename='NULL' then firstname ||' '|| middlename ||' '|| lastname else firstname ||' '|| lastname end as cuatomer_name , a.gender,a.emailaddress,a.englisheducation,a.addressline1,a.datefirstpurchase
,b.city,b.stateprovincename as statename,b.englishcountryregionname as regionname
from customer as a join geography as b
on a.geographykey=b.geographykey;

create table customer_geography_data as select a.customerkey,a.geographykey,a.customeralternatekey,case when not middlename='NULL' then firstname ||' '|| middlename ||' '|| lastname else firstname ||' '|| lastname end as cuatomer_name , a.gender,a.emailaddress,a.englisheducation,a.addressline1,a.datefirstpurchase
,b.city,b.stateprovincename as statename,b.englishcountryregionname as regionname
from customer as a join geography as b
on a.geographykey=b.geographykey;

select * from customer_geography_data;


---------------------------------------------------------

select * from date where calendaryear>2020;

select * from internsales where orderdatekey>202021231;

alter table internetsales
alter column orderdatekey type integer
using orderdatekey :: integer;


------------------------------------------------------deleting some more unreleavant columns 

alter table customer_geography_data
drop column geographykey,
drop column customeralternatekey,
drop column emailaddress,
drop column englisheducation;

select * from customer_geography_data;


alter table internetsales
drop column shipdatekey,
drop column totalproductcost,
drop column orderdate,
drop column duedate,
drop column shipdate;

select * from internetsales;

alter table product_detail
drop column productalternatekey,
drop column productcategorykey,
drop column color;

select * from product_detail;


