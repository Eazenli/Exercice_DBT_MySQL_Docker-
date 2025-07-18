select 
    ProductDescriptionID,
    Description as ProductDescription
from {{ source('dojo_dbt_w12', 'raw_productdescription') }}