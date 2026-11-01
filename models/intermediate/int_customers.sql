with 
    customers as (
        select * from {{ ref('stg_erp_customers') }}
    ),

   person as (
        select * from {{ ref('stg_erp_person') }}
   ),

   store as  (
         select * from {{ ref('stg_erp_sales_store') }}
   ),
 
   customers_enriquecido as (
        select
            c.pk_customer
            , p.pk_person                                                               as person_id
            , p.person_first_name                                                       as first_name
            , p.person_full_name                                                        as full_name
            , p.person_type
            , case 
                when s.pk_store is not null then 'Store'
                else 'Individual'
              end                                                                       as customer_type
            , coalesce( s.name_store,
                        nullif(trim(concat_ws('', p.person_full_name)), ''), 'Unknow')  as customer_name                                
        from customers c
        left join person p
            on c.fk_person = p.pk_person
        left join store s
            on c.fk_store = s.pk_store        
        )

   select * from customers_enriquecido