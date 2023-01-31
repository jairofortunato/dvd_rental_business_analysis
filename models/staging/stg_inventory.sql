with 
    source as (
        select 
            inventory_id		
            , film_id
            , store_id	

        from {{ source('discorama_dataset','inventory') }}
    )

select * from source