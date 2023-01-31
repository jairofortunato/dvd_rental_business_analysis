with 
    source as (
        select 
                film_id	
                , category_id		

        from {{ source('discorama_dataset','film_category') }}
    )

select * from source