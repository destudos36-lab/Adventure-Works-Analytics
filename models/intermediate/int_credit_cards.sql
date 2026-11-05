
with credit_card as (

    select
        pk_credit_card,
        trim(card_type) as card_type
    from {{ ref('stg_erp_credit_card') }}

),

credit_card_enriquecido as (

    select
        pk_credit_card,
        coalesce(
            nullif(trim(card_type), ''),
            'Unknown'
        ) as card_type
    from credit_card

    union all

    select
        -1 as pk_credit_card,
        'Sem cartão' as card_type

)

select *
from credit_card_enriquecido




