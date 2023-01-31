with 
    source as (
        select 
                payment_id
                , amount
                , payment_date

                , customer_id
                , staff_id
                , rental_id


        from {{ source('discorama_dataset','payment') }}
    )

select * from source