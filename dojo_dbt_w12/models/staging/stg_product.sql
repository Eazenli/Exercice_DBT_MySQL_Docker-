select
    ProductID as ProductKey,
    Name as ProductName,
    ProductNumber,
    Color as ProductColor,
    Size as ProductSize,
    StandardCost as ProduCost,
    ListPrice as ProductPrice,
    ProductModelID,
    ProductSubcategoryID as ProductSubcategoryKey
from {{ source('dojo_dbt_w12', 'raw_product') }}