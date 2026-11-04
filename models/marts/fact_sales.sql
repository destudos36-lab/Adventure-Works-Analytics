with 
    sales as(
        select *
        from {{ ref('int_sales_order') }}
    )

select * from sales