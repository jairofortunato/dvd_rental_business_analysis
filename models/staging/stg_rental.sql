with 
    source as (
        select 
            /* Primary key */
            rental_id
            /* Foreign key */
            , rental_date
            , return_date
			
            , inventory_id
            , customer_id
            , staff_id

        from {{ source('discorama_dataset','rental') }}
    )

select * from source