with 
    source as (
        select 
               category_id
                , name

        from {{ source('discorama_dataset','category') }}
    )

select * from source