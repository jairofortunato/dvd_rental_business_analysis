with 
    dim_customer as (
          select 
            customer.customer_id
            , store_id
            , first_name
            , last_name
            , email
            , activebool
            , create_date
            , case 
                when count(rental.customer_id) between 0 and 23 then 'low rentals'
                when count(rental.customer_id) between 24 and 35 then 'medium rentals'
                else 'high rentals'
            end as rental_group 
            , address.address1
            , address.phone
            , city.city_name
            , country.country_name
        from {{ ref('stg_customer') }} as customer
        left join {{ ref('stg_rental') }} as rental on customer.customer_id = rental.customer_id
        left join {{ ref('stg_address') }} as address on customer.address_id = address.address_id
        left join {{ ref('stg_city') }} as city on address.city_id = city.city_id
        left join {{ ref('stg_country') }} as country on city.country_id = country.country_id
        group by 
            customer.customer_id
            , store_id
            , first_name
            , last_name
            , email
            , activebool
            , create_date
            , address.address1
            , address.phone
            , city.city_name
            , country.country_name
    )
select *
from dim_customer