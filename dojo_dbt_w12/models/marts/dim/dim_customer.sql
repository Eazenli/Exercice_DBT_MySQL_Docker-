select
    c.CustomerID,
    c.PersonID,
    p.FirstName,
    p.LastName,
    p.BirthDate,
    p.MaritalStatus,
    p.YearlyIncome,
    p.Gender,
    p.TotalChildren,
    p.Education,
    p.Occupation,
    p.HomeOwnerFlag,
    p.NumberCarsOwned
from {{ref ('stg_customer')}} c
left join {{ref ('stg_person')}} p
on c.PersonID = p.BusinessEntityID