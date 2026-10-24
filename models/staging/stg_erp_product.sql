with 
    fonte_product as (
        select * 
        from {{ source('adventure_works', 'production_product') }}
    )


    , renamed as (
    select
        cast(productid as int)                      as pk_product
        ,   cast(productsubcategoryid as int)       as fk_product_subcategory
        ,   trim(cast(name as string))              as product_name
        ,   trim(cast(productnumber as string))     as product_number        
        ,   trim(cast(color as string))             as product_color
        ,   trim(cast(size as string))              as product_size
        ,   cast(standardcost as decimal(18,4))     as standard_cost
        ,   cast(listprice as decimal(18,4))        as list_price                     
        ,   cast(sellstartdate as date)             as sell_start_date
        ,   cast(sellenddate as date)               as sell_end_date        
    from fonte_product
)


select * from renamed