with source as ( 

    select * from {{ ref('trans_product') }}
),

final as (

    select * from source
)

select * from final