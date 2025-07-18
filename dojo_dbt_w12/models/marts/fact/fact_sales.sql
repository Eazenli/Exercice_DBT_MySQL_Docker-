select
    soh.SalesOrderKey,
    soh.SalesOrderNumber,
    sod.ProductID,
    soh.CustomerKey,
    soh.TerritoryKey,
    soh.OrderDate,
    sod.OrderQty
from {{ ref('stg_salesorderheader') }} soh 
left join {{ ref('stg_salesorderdetail') }} sod 
    on soh.SalesOrderKey = sod.SalesOrderID