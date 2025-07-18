select
    ProductSubCategoryID as ProductSubCategoryKey,
    ProductCategoryID,
    Name as ProductSubCategorylName
from {{ source('dojo_dbt_w12', 'raw_productsubcategory') }}