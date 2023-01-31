with 
    source as (
        select 
                country_id	
                , country_name

        from {{ source('discorama_dataset','country') }}
    )

select * from source