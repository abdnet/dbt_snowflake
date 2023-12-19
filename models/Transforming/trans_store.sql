with
    source as (select * from {{ ref("stg_stores") }}),

    valid_store_doublon as (

        select distinct (id), name, opened_at, tax_rate from source

    ),

    valid_store_not_null as (

        select *
        from valid_store_doublon

        where
            id is not null
            and name is not null
            and tax_rate is not null
            and tax_rate > 0
    ),

    renamed as (select id, name, opened_at, tax_rate from valid_store_not_null),

    final as (select * from renamed)

select * from final
