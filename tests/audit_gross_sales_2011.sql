/*
    Esse teste certifica que as aditoria da gross_sales de 2011 batem com o valor auditado de 12646112.16
*/


with vendas_brutas_2011 as (
    select
        cast(sum(order_qtd * unit_price) as decimal(18,4)) as total_vendas_brutas     
    from {{ ref('int_sales_order') }}
    where extract(year from order_date) = 2011
)

select *
from vendas_brutas_2011
where
    total_vendas_brutas not between 12646112.0800 and 12646112.2499
