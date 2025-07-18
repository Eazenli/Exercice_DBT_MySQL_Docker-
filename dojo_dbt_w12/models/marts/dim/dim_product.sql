select
    p.ProductKey,
    p.ProductSubCategoryKey,
    p.ProductNumber,
    p.ProductName,
    pm.ProductModelName,
    pd.ProductDescription,
    p.ProductColor,
    p.ProductSize,
    p.ProduCost,
    p.ProductPrice
from {{ ref('stg_product')}} p
left join {{ ref('stg_productdescription')}} pd 
on p.ProductKey = pd.ProductDescriptionID
left join {{ ref('stg_productmodel')}} pm 
on p.ProductModelID = pm.ProductModelID

