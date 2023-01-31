with 
    source as (
        select 
                city_id	
                , city_name
                , country_id

        from {{ source('discorama_dataset','city') }}
    )

select * from source