select
    ProductCategoryID as ProductCategoryKey,
    Name as ProductCategorylName
from {{ source('dojo_dbt_w12', 'raw_productcategory') }}