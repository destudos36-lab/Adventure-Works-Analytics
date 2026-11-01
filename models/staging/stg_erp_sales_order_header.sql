with 
    fonte_sales_order_header as (
        select * 
        from {{ source('adventure_works', 'sales_salesorderheader') }}
    )


    , renamed as (
        select
            cast(salesorderid as int)                                           as pk_sales_order
           ,    cast(customerid as int)                                         as fk_customer           
           ,    cast(territoryid as int)                                        as fk_territory
           ,    cast(billtoaddressid as int)                                    as fk_bill_to_address
           ,    cast(shiptoaddressid as int)                                    as fk_ship_to_address
           ,    cast(creditcardid as int)                                       as fk_credit_card           
           ,    cast(revisionnumber as int)                                     as revision_number
           ,    cast(orderdate as date)                                         as order_date
           ,    cast(duedate as date)                                           as due_date
           ,    cast(shipdate as date)                                          as ship_date
           ,    cast(status as int)                                             as order_status
           ,    case
                    when lower(onlineorderflag) = 'true' then true
                    else false
                end                                                             as is_online_order
           ,   cast(subtotal as decimal(18,2))                                  as subtotal
           ,   cast(taxamt as decimal(18,4))                                    as tax_amount
           ,   cast(freight as decimal(18,4))                                   as freight
           ,   cast(totaldue as decimal(18,4))                                  as total_due           
        from fonte_sales_order_header
    )

    select * from renamed

