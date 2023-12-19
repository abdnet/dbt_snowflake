WITH source as (

    select * from {{ ref('products') }}

),

final as (
    select * from source
)

select * from final