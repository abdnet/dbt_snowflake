with source as (

    select * from  {{ ref('stg_items') }}

),

valid_items_doublon as (

        select 
            distinct (id),
            order_id, 
            sku 
        from source

    ),

valid_item_not_null as (

        select *
        from valid_items_doublon

        where
            id is not null
            and order_id is not null
            and sku is not null
    ),

renamed as (
    
    select 
        id,
        order_id, 
        sku
         from valid_item_not_null
    ),


final as (select * from renamed)

select * from final


