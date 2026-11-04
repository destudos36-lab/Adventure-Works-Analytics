with
    datas as(
        select *
        from {{ ref('int_data') }}
    )

select * from datas