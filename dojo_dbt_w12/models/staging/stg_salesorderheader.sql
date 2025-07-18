select 
    SalesOrderID as SalesOrderKey,
    SalesOrderNumber,
    OrderDate,
    CustomerID as CustomerKey,
    TerritoryID as TerritoryKey
from {{ source('dojo_dbt_w12', 'raw_salesorderheader') }}