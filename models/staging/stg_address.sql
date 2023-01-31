with 
    source as (
        select 
          address_id
          , address1
          , address2
          , district
          , city_id
          , postal_code
          , phone

        from {{ source('discorama_dataset','address') }}
    )

select * from source