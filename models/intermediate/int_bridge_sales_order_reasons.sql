with ponte_reason as (
    select *
    from {{ ref('stg_erp_sales_head_reason') }}
),

ponte_reason_final as (
    select *
    from ponte_reason
)

select * from ponte_reason_final