with source as (
    
    select * from {{ source("ecommerce", "src_supplies") }}
    
),

final as (

    select * from source
)

select * from final
