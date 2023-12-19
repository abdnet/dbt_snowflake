with source as (

    select * from {{ source('ecommerce', 'src_customers') }}

),

renamed as (

    select
        id,
        name

    from source

),

final as (

    select * from renamed

)

select * from final
