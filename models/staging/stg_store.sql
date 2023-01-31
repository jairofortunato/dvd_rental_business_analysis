with 
    source as (
        select 
            store_id		
            , manager_staff_id	
            , address_id	

        from {{ source('discorama_dataset','store') }}
    )

select * from source