with 
    fonte_customers as (
        select * 
        from {{ source('adventure_works', 'sales_customer') }}
    )


    , renamed as (
        select
            cast(customerid as int)         as pk_customer
           , cast(personid as int)          as fk_person
           , cast(storeid as int)           as fk_store
           , cast(territoryid as int)       as fk_territory           
        from fonte_customers
    )

    select * from renamed

