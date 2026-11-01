with vendas_brutas_2011 as (
    select
        cast(sum(gross_sales) as decimal(18,2)) as total_vendas_brutas
    from {{ ref('int_sales_order') }}
    where extract(year from order_date) = 2011
)

select *
from vendas_brutas_2011
where
    total_vendas_brutas between 12646112.08 and 12646112.24