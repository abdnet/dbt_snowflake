with source as ( 

    select * from {{ ref('items') }}
),

final as (

    select * from source
)

select * from final