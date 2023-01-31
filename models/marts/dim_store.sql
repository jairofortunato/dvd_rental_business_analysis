with 
    dim_store as (
            select 
            store_id
            , manager_staff_id
            , store.address_id 
            , address.address1
            , address.phone
            , city.city_name
            , country.country_name
        from {{ ref('stg_store') }} as store 
        left join {{ ref('stg_address') }} as address on store.address_id = address.address_id
        left join {{ ref('stg_city') }} as city on address.city_id = city.city_id
        left join {{ ref('stg_country') }} as country on city.country_id = country.country_id
    )
select *
from dim_store