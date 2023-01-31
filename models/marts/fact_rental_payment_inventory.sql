with 
    fact_rental_payment_inventory as (
            select 
             rental.rental_id
            , payment.amount		
            , rental.inventory_id
            , rental.customer_id
            , rental.staff_id
            , payment.payment_id
            , inventory.film_id
            , inventory.store_id	
            , rental.rental_date
            , rental.return_date
            , film.rental_duration
            , case when(film.rental_duration > date_diff(rental.return_date , rental.rental_date, DAY)) THEN "Returned early"
              when (film.rental_duration = date_diff(rental.return_date , rental.rental_date, DAY)) THEN "Returned on time"
              else "Overdue"
              End as return_status
        from {{ ref('stg_rental') }} as rental
        left join {{ ref('stg_payment') }} as payment on rental.rental_id = payment.rental_id
        left join {{ ref('stg_inventory') }} as inventory on rental.inventory_id = inventory.inventory_id
        left join {{ ref('stg_film') }} as film on inventory.film_id = film.film_id
    )
select *
from fact_rental_payment_inventory