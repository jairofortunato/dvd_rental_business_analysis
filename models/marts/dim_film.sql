with 
    dim_film as (
            select 
            film.film_id
            , film.title
            , film.rental_duration
            , film.rental_rate
            , film.replacement_cost
            , film.release_year
            , film.language_id
            , film.rating 
            , film_category.category_id
            , category.name		
        from {{ ref('stg_film') }} as film
        left join {{ ref('stg_film_category') }} as film_category on film.film_id = film_category.film_id
        left join {{ ref('stg_category') }} as category on film_category.category_id = category.category_id
    )
select *
from dim_film