WITH source as (

    select * from {{ ref('customers') }}

),

final as (

    select * from source 

)

select * from final