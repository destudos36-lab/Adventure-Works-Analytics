with 
    fonte_credit_card as (
        select * 
        from {{ source('adventure_works', 'sales_creditcard') }}
    )


    , renamed as (
        select
            cast(creditcardid as int)               as pk_credit_card
           ,    cast(cardtype as string)            as card_type
        from fonte_credit_card
    )

    select * from renamed

