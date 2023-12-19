with source as (
    
    select * from {{ source("ecommerce", "src_products") }}
    
    ),

final as (
    
    select 
        a, 
        sku, 
        name, 
        type, 
        price, 
        description 
    from source
    )

select * from final
