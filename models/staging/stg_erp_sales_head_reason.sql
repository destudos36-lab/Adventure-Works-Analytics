with 
    fonte_sales_head_reason as (
        select * 
        from {{ source('adventure_works', 'sales_salesorderheadersalesreason') }}
    )


    , renamed as (
        select
            cast(salesorderid as int)               as fk_sales_order
           ,    cast(salesreasonid as int)          as fk_sales_reason  
        from fonte_sales_head_reason
    )

    select * from renamed

