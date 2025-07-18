select 
    st.TerritoryKey,
    st.Region,
    cr.Country,
    st.Continent
from {{ ref('stg_salesterritory') }} st 
left join {{ ref('stg_countryregion') }} cr 
using (CountryRegionCode) 