with 
    source as (
        select 
            staff_id
            , first_name
            , last_name
            , address_id		
            , email
            , store_id
            , active
            , username

        from {{ source('discorama_dataset','staff') }}
    )

select * from source