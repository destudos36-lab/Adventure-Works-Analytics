
with order_header as (

   select * from {{ ref('stg_erp_sales_order_header') }}

),

status_orders as (
    select 
        distinct
        order_status                    as status
        , case order_status
            when 1 then 'In Process'
            when 2 then 'Approved'
            when 3 then 'Backordered'
            when 4 then 'Rejected'
            when 5 then 'shipped'
            when 6 then 'Cancelled'
        end                             as status_description
    from order_header)

select *
from status_orders