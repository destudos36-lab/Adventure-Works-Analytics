with 
    fonte_store as (
        select * 
        from {{ source('adventure_works', 'person_countryregion') }}
    )


    , renamed as (
        select
             coalesce(
                nullif(trim(cast(countryregioncode as STRING)), ''),
                'NA'
            )                                                           as pk_country_region
            ,   trim(cast(name as string))                              as country_region_name
        from fonte_store
    )

    select * from renamed

