select
    CountryRegionCode,
    Name as Country
from {{ source('dojo_dbt_w12', 'raw_countryregion') }}