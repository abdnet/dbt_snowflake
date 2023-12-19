with source as (
    
    select * from {{ source("ecommerce", "src_stores") }}
    
),

final as (

    select * from source
)

select * from final
