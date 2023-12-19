with source as (

    select * from {{ ref('trans_store') }}

),

final as (
    
    select * from source

)

select * from final