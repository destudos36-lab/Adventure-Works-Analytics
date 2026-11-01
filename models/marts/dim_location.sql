with 
    locations as(
        select *
        from {{ ref('int_locations') }}
    )

select * from locations