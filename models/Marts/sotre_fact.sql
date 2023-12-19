-- sources
with
    source_stores as (select * from {{ ref("dim_store") }}),
    source_orders as (select * from {{ ref("dim_order") }}),
    source_items as (select * from {{ ref("dim_item") }}),
    source_products as (select * from {{ ref("dim_product") }}),

    store_sales as (
        select
            stores.id as store_id,
            orders.ordered_at as order_date,
            orders.id as order_id,
            products.sku,
            orders.subtotal,
            orders.tax_paid,
            orders.order_total
        from source_stores as stores
        join source_orders as orders on stores.id = orders.store_id
        join source_items as items on orders.id = items.order_id
        join source_products as products on items.sku = products.sku
    )

select *
from store_sales
