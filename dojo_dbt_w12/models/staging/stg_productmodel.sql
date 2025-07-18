select 
    ProductModelID,
    Name as ProductModelName
from {{ source('dojo_dbt_w12', 'raw_productmodel') }}