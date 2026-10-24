with 
    fonte_store as (
        select * 
        from {{ source('adventure_works', 'person_countryregion') }}
    )


    , renamed as (
        select
            trim(cast(countryregioncode as string))             as pk_country_region
            ,   trim(cast(name as string))                      as country_region_name
        from fonte_store
    )

    select * from renamed

