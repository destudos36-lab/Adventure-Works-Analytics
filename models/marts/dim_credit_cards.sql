with
    credit_card as (
        select *
        from {{ ref('int_credit_cards') }}
    )
select * from credit_card