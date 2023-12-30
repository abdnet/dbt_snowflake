with
    source as (select * from {{ ref("stg_orders") }}),

    customers as (select * from {{ ref("trans_customer") }}),

    stores as (select * from {{ ref("trans_store") }}),

    valid_order_not_null as (

        select *
        from source
        where id is not null and customer is not null and store_id is not null
    ),

    valid_order_customer_exist as (

        select * from valid_order_not_null where customer in (select id from customers)

    ),

    valid_order_store_exist as (
        select *
        from valid_order_customer_exist
        where store_id in (select id from stores)
    ),



    renamed as (
        select id, customer, ordered_at, store_id, subtotal, tax_paid, order_total
        from valid_order_store_exist
    ),

    final as (select * from renamed)

select *
from final
