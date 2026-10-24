with 
    fonte_address as (
        select * 
        from {{ source('adventure_works', 'person_address') }}
    )


    , renamed as (
        select
            cast(addressid as int)            as pk_address
            ,   cast(stateprovinceid as int)    as fk_state_province 
            ,   cast(addressline1 as string)    as address_line_1
            ,   cast(addressline2 as string)    as address_line_2
            ,   cast(city as string)            as city            
            ,   cast(postalcode as string)      as postal_code            
        from fonte_address
    )

    select * from renamed

