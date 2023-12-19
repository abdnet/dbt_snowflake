with source as (

    select * from {{ ref('orders') }}

),

final as (
    
    select * from source

)

select * from final