-- - sources
with
    stores as (select * from {{ ref("dim_store") }}),

    orders as (select * from {{ ref("dim_order") }}),

    store_sales_summary_fact as (
        select
            s.id as store_id,
            s.name,
            date_trunc('month', o.ordered_at) as month,
            sum(o.order_total) as total_sales
        from stores s
        join orders o on s.id = o.store_id
        group by 1, 2, 3
        order by total_sales desc
    ),

    final as (select * from store_sales_summary_fact)

select *
from final
