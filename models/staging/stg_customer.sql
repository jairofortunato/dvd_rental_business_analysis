with 
    source as (
        select 
            customer_id
            , store_id
            , first_name
            , last_name
            , email
            , address_id
            , activebool
            , create_date
	
        from {{ source('discorama_dataset','customer') }}
    )

select * from source