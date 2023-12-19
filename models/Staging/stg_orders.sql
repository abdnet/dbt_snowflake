with source as (

    select * from {{ source('ecommerce', 'src_orders') }}

),

renamed as (

    select
        id,
        customer,
        ordered_at,
        store_id,
        subtotal,
        tax_paid,
        order_total

    from source

),

final as (

    select * from renamed

)

select * from final
