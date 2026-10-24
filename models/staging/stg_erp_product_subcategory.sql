with 
    fonte_product_subcategory as (
        select * 
        from {{ source('adventure_works', 'production_productsubcategory') }}
    )


    , renamed as (
        select
            cast(productsubcategoryid as int)               as pk_product_subcategory
           ,    cast(productcategoryid as int)              as fk_product_category
           ,    trim(cast(name as string))                  as product_subcategory_name           
        from fonte_product_subcategory
    )

    select * from renamed

