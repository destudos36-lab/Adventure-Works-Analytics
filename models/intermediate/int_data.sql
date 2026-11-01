{% set start_date = var('dates_start', '2011-01-01') %}
{% set end_date   = var('dates_end',   '2014-12-31') %}

with spine as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('" ~ start_date ~ "' as date)",
        end_date  ="cast(dateadd(day, 1, cast('" ~ end_date ~ "' as date)) as date)"
    ) }}
),

calendar as (
    select cast(date_day as date) as date_day
    from spine
),

enriched as (
    select
        -- chaves
        date_day             as date_key,
        date_day,

        -- partes da data
        year(date_day)       as year_number,
        quarter(date_day)    as quarter_number,
        month(date_day)      as month_number,
        day(date_day)        as day_of_month,
        weekofyear(date_day) as week_of_year,
        dayofweek(date_day)  as day_of_week,

        -- rótulos
        date_format(date_day, 'MMMM') as month_name,
        date_format(date_day, 'MMM')  as month_short_name,
        date_format(date_day, 'EEEE') as day_name,
        substring(date_format(date_day, 'MMM'), 1, 1) as month_initial,

        -- agrupadores
        date_format(date_day, 'yyyy-MM') as year_month,
        concat(cast(year(date_day) as string), '-Q',
               cast(quarter(date_day) as string)) as year_quarter,

        -- limites do mês
        trunc(date_day, 'month') as first_day_of_month,
        last_day(date_day)       as last_day_of_month,

        -- flag
        case when dayofweek(date_day) in (1, 7) then true else false end as is_weekend
    from calendar
)

select * from enriched
