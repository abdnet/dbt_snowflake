with source as (
    
    select * from {{ ref('stg_products') }}
    
),

valid_products_doublon as (
    
        select 
            distinct (sku),
            name, 
            type, 
            price,
            description 
        from source
),

valid_products_not_null as (

    select *
    from valid_products_doublon
    where SKU IS NOT NULL
        AND NAME IS NOT NULL
        AND PRICE IS NOT NULL AND PRICE>0

),

renamed as (

     select 
            sku,
            name, 
            type, 
            price,
            description 
    from valid_products_not_null
),


final as (
    select *
    from renamed
    )

select * from final
