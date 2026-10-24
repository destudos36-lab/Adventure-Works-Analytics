with 
    fonte_order_detail as (
        select * 
        from {{ source('adventure_works', 'sales_salesorderdetail') }}
    )


    , renamed as (
        select
            cast(salesorderdetailid as int)                     as PK_sales_order_detail
            ,   cast(salesorderid as int)                       as fk_sales_order
            ,   cast(carriertrackingnumber as string)           as carrier_tracking_number            
            ,   cast(productid as int)                          as fk_product
            ,   cast(specialofferid as int)                     as fk_special_offer
            ,   cast(orderqty as int)                           as order_qtd
            ,   cast(unitprice as decimal(18,2))                as unit_price
            ,   cast(unitpricediscount as decimal(18,2))        as unit_price_discount            
        from fonte_order_detail
    )

    select * from renamed

