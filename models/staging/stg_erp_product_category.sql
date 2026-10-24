with 
    fonte_product_category as (
        select * 
        from {{ source('adventure_works', 'production_productcategory') }}
    )


    , renamed as (
        select
            cast(productcategoryid as int)              as pk_product_category
           , trim(cast(name as string))                 as product_category_name                    
        from fonte_product_category
    )

    select * from renamed

