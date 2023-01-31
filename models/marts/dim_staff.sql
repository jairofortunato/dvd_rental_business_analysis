with 
    dim_staff as (
            select 
             staff_id
            , first_name
            , last_name
            , address_id		
            , email
            , store_id
            , active
            , username
        from {{ ref('stg_staff') }} 
    )
select *
from dim_staff