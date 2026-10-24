with 
    fonte_sales_reason as (
        select * 
        from {{ source('adventure_works', 'sales_salesreason') }}
    )


    , renamed as (
        select
            cast(salesreasonid as int)                                  as pk_sales_reason
           , trim(regexp_replace(cast(name as string), '\\s+', ' '))    as reason_name
           , cast(reasontype as string)                                 as reason_type
        from fonte_sales_reason
    )

    select * from renamed

