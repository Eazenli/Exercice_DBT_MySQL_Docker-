select
    BusinessEntityID,
    FirstName,
    LastName,
    BirthDate,
    MaritalStatus,
    YearlyIncome,
    Gender,
    TotalChildren,
    Education,
    Occupation,
    HomeOwnerFlag,
    NumberCarsOwned
from {{ source('dojo_dbt_w12', 'raw_person') }}