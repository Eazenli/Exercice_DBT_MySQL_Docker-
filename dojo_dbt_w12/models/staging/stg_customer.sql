select
    CustomerID,
    PersonID
from {{ source('dojo_dbt_w12', 'raw_customer') }}
where PersonID is not null 