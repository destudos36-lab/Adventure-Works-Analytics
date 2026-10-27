with sales_reason as (
    select * from {{ ref('stg_erp_sales_reason') }}
),

sales_reason_enriquecida as (
    select *
    from sales_reason
)

select * from sales_reason_enriquecida