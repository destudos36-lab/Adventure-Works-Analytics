with 
    sales_reasons as(
        select *
        from {{ ref('int_sales_reasons') }}
    )

select * from sales_reasons