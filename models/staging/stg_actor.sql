with 
    source as (
        select 
            actor_id
            , first_name
            , last_name

        from {{ source('discorama_dataset','actor') }}
    )

select * from source