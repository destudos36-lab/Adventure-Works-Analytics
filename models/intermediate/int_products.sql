with 
    products as (
        select *
        from {{ ref('stg_erp_product') }}
    ),

    subcategory as (
        select *
        from {{ ref('stg_erp_product_subcategory') }}
    ),

    category as (
        select *
        from {{ ref('stg_erp_product_category') }}
    ),

    products_enriquecidos as (
        select
            p.pk_product
            , p.product_name
            , p.product_number
            , coalesce(p.product_color, 'N/A')                      as product_color
            , coalesce(p.product_size, 'N/A')                       as product_size
            , coalesce(sc.product_subcategory_name, 'Undefined')    as subcategory_name
            , coalesce(c.product_category_name, 'Undefined')        as category_name
            , p.standard_cost
            , p.list_price
            , p.sell_start_date
        from products p
        left join subcategory sc
            on p.fk_product_subcategory = sc.pk_product_subcategory
        left join category c
            on sc.fk_product_category = c.pk_product_category
    )

select * from products_enriquecidos