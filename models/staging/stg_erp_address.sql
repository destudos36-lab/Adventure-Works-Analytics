with 
    fonte_address as (
        select * 
        from {{ source('adventure_works', 'person_address') }}
    )


    , renamed as (
        select
            cast(addressid as int)                                                                          as pk_address
            ,   cast(stateprovinceid as int)                                                                as fk_state_province 
            ,   nullif(trim(decode(encode(cast(addressline1 as string), 'ISO-8859-1'), 'UTF-8')), '')       as address_line_1
            ,   nullif(trim(decode(encode(cast(addressline2 as string), 'ISO-8859-1'), 'UTF-8')), '')       as address_line_2
            ,   nullif(trim(decode(encode(cast(city as string), 'ISO-8859-1'), 'UTF-8')), '')               as city            
            ,   cast(postalcode as string)                                                                  as postal_code            
        from fonte_address
    )

    select * from renamed

