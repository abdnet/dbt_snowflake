with source as ( 

    select * from {{ ref('trans_items') }}
),

final as (

    select * from source
)

select * from final