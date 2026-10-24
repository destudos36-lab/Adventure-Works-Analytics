with 
    fonte_store as (
        select * 
        from {{ source('adventure_works', 'sales_store') }}
    )


    , renamed as (
        select
            cast(businessentityid as int)           as pk_store
           ,    trim(cast(name as string))          as name_store
           ,    cast(salespersonid as int)          as fk_salesperson           
        from fonte_store
    )

    select * from renamed

