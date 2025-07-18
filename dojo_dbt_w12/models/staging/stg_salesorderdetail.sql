select 
    SalesOrderID,
    OrderQty,
    ProductID
from {{ source('dojo_dbt_w12', 'raw_salesorderdetail') }}