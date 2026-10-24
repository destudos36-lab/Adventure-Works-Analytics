with 
    fonte_state_province as (
        select * 
        from {{ source('adventure_works', 'person_stateprovince') }}
    )


    , renamed as (
        select
            cast(stateprovinceid as int)                        as pk_state_province
            , trim(cast(countryregioncode as string))           as fk_country_region
            , trim(cast(territoryid as int))                    as fk_territory
            , trim(cast(stateprovincecode as string))           as state_province_code            
            , trim(cast(name as string))                        as state_province_name
        from fonte_state_province
    )

    select * from renamed

