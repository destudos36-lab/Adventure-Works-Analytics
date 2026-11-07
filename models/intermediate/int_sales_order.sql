with detail as(
    select * from {{ ref('stg_erp_sales_order_detail') }}
),

header as  (
    select * from {{ ref('stg_erp_sales_order_header') }}
),

credit_cards as (

    select *
    from {{ ref('int_credit_cards') }}
),

customers as (
    select * from {{ ref('int_customers') }}
),

products as (
    select * from {{ ref('int_products') }}
),

datas as (
    select * from {{ ref('int_data') }}
),

joined as (
    select
        d.pk_sales_order_detail
        , d.fk_sales_order
        , d.carrier_tracking_number
        , d.fk_product
        , case
            when h.fk_credit_card is null then -1
            else cc.pk_credit_card
        end                                                                                             as fk_credit_card
        , c.pk_customer                                                                                 as fk_customer
        , h.fk_bill_to_address
        , h.fk_ship_to_address   

      --   Datas e Atributos
        , dt.date_key                                                                                    as order_date
        , dt.date_key                                                                                    as due_date
        , dt.date_key                                                                                    as ship_date           
        , h.order_status
        , h.is_online_order

     --     Métricas 
        , d.order_qtd
        , d.unit_price
        , d.unit_price_discount  

        , cast(d.order_qtd * d.unit_price as decimal(18,4))                                             as gross_sales 
        , cast(d.unit_price_discount as decimal(18,4))                                                  as discount_value
        , cast(d.order_qtd * d.unit_price * (1 - d.unit_price_discount)   as decimal(18,2))             as net_sales

        , h.subtotal
        , h.tax_amount
        , h.freight
        , h.total_due
    from detail d
    left join header h
        on d.fk_sales_order = h.pk_sales_order
    left join credit_cards cc
        on coalesce(h.fk_credit_card, -1) = cc.pk_credit_card
    left join customers c
        on h.fk_customer = c.pk_customer
    left join datas dt
        on h.order_date = dt.date_key
    left join datas d
        on h.due_date = dt.date_key
    left join datas d
        on h.ship_date = dt.date_key
        
)

select * from joined
