with source as (

    select * from {{ ref('trans_order') }}

),

final as (
    
    select * from source

)

select * from final