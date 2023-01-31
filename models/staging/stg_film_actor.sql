with 
    source as (
        select 
            actor_id	
            , film_id

        from {{ source('discorama_dataset','film_actor') }}
    )

select * from   source