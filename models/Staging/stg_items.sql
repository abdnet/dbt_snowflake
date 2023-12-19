with 

source as (

    select * from {{ source('ecommerce', 'src_items') }}

),

renamed as (

    select
        a,
        id,
        order_id,
        sku

    from source

)

select * from renamed
