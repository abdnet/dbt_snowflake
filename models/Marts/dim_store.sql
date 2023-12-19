with source as (

    select * from {{ ref('stores') }}

),

final as (
    
    select * from source

)

select * from final