with 
    fonte_person as (
        select * 
        from {{ source('adventure_works', 'person_person') }}
    )


    , renamed as (
        select
            cast(businessentityid as int)                        as pk_person
            ,   cast(persontype as string)                       as person_type
            ,   trim(firstname)                                  as person_first_name
            ,   trim(middlename)                                 as person_middle_name
            ,   trim(lastname)                                   as person_last_name
            ,   coalesce(title, '')                              as person_title
            ,   trim(
                    coalesce(firstname, '') || ' ' ||
                    coalesce(middlename, '') || ' ' ||
                    coalesce(lastname, '')
                )                                                as person_full_name
        from fonte_person
    )

    select * from renamed

