with
    status_ as (
        select *
        from {{ ref('int_status_order') }}
    )
select * from status_