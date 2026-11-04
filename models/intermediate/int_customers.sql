
with

customers as (

    select
        pk_customer,
        fk_person,
        fk_store,
        fk_territory
    from {{ ref('stg_erp_customers') }}

),

person as (

    select
        pk_person,
        trim(person_first_name) as person_first_name,
        trim(person_full_name) as person_full_name,
        upper(trim(person_type)) as person_type
    from {{ ref('stg_erp_person') }}

),

store as (

    select
        pk_store,
        trim(name_store) as name_store
    from {{ ref('stg_erp_sales_store') }}

),

customers_enriquecido as (

    select

        c.pk_customer,

        p.pk_person as person_id,

        p.person_first_name as first_name,

        p.person_full_name as full_name,

        p.person_type,

        case
            when c.fk_store is not null then 'Store'
            else 'Individual'
        end as customer_type,

        coalesce(
            nullif(trim(s.name_store), ''),
            nullif(trim(p.person_full_name), ''),
            nullif(trim(p.person_first_name), ''),
            'Unknown'
        ) as customer_name,

        c.fk_store,
        c.fk_person,

        case
            when c.fk_store is null
             and c.fk_person is null
                then true
            else false
        end as invalid_customer_identity,

        case
            when c.fk_store is not null
             and s.pk_store is null
                then true
            else false
        end as invalid_store_reference,

        case
            when c.fk_person is not null
             and p.pk_person is null
                then true
            else false
        end as invalid_person_reference

    from customers c

    left join person p
        on c.fk_person = p.pk_person

    left join store s
        on c.fk_store = s.pk_store

)

select *
from customers_enriquecido
