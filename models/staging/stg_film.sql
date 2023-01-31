with 
    source as (
        select 
                film_id
                , title
                , rental_duration
                , rental_rate
                , replacement_cost
                , description
                , release_year
                , language_id
                , length
                , rating
                , special_features
                , fulltext

        from {{ source('discorama_dataset','film') }}
    )

select * from source