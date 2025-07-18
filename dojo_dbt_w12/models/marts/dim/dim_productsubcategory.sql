select 
    psc.ProductSubcategoryKey,
    psc.ProductCategoryID,
    psc.ProductSubCategorylName,
    pc.ProductCategorylName
from {{ ref('stg_productsubcategory') }} psc 
left join {{ ref('stg_productcategory') }} pc 
on psc.ProductCategoryID = pc.ProductCategoryKey