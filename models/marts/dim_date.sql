with 
    dim_date as (
            select 
            rental.rental_id
            , rental.rental_date
            , rental.return_date
            , DATE_DIFF(return_date, rental_date, DAY) AS rental_duration 
            , payment.payment_date
            , EXTRACT(DAY FROM payment.payment_date) as day_payment
            , EXTRACT(MONTH FROM payment.payment_date) as month_payment
            , EXTRACT(YEAR FROM payment.payment_date) as year_payment
            , EXTRACT(WEEK FROM payment.payment_date) as week_payment
        from {{ ref('stg_rental') }} as rental
        left join {{ ref('stg_payment') }} as payment on rental.rental_id = payment.rental_id
    )
select *
from dim_date