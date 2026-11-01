with 
    address_ as (
        select * from {{ ref('stg_erp_address') }}
   ),

    country as (
        select * from {{ ref('stg_erp_country_region') }}
    ),

    province as (
        select * from {{ ref('stg_erp_state_province') }}
    ),

    locations as (
        select
            a.pk_address
            , a.address_line_1
            , a.address_line_2
            , a.city
            , a.postal_code
            , p.pk_state_province
            , p.state_province_code
            , p.state_province_name
            , c.pk_country_region           as country_region_code
            , c.country_region_name
        from address_ a
        left join province p
            on a.fk_state_province = p.pk_state_province
        left join country c
            on p.fk_country_region = c.pk_country_region
    )

select * from locations