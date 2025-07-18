select 
    TerritoryID as TerritoryKey,
    Name as Region,
    CountryRegionCode,
    'Group' as Continent
from {{ source('dojo_dbt_w12', 'raw_salesterritory') }} 