-- models/tests/total_order_and_item_price.sql
-- Test pour vérifier le total des commandes (ORDER_TOTAL)
{{ config(description="QUALITY_TOTAL_ORDER_AND_ITEM_PRICE", severity="warn") }}
with
    order_totals as (
            
            select 
                    o.id,
                    sum(i.sku)  as nombre_article,
                    sum(sup.cost) as order_total
            from {{ ref('dim_order') }} o 
            join {{ ref('dim_item') }} i on i.order_id=o.id
            join {{ ref('dim_supplier') }} sup on sup.sku=i.sku
            group by 1

    )




--         select o.id as order_id, sum(i.subtotal) as calculated_order_total
--         from {{ ref("DIM_ORDER") }} o
--         join {{ ref("DIM_ITEM") }} i on o.id = i.order_id
--         group by 1
--     )

-- select o.id as order_id, o.order_total, ot.calculated_order_total
-- from {{ ref("DIM_ORDER") }} o
-- join order_totals ot on o.id = ot.order_id
-- having o.order_total != ot.calculated_order_total
-- union
-- select
--     i.order_id,
--     i.subtotal as item_subtotal,
--     p.price,
--     i.quantity,
--     i.subtotal as calculated_item_price
-- from {{ ref("DIM_ITEM") }} i
-- join {{ ref("DIM_PRODUCT") }} p on i.sku = p.sku
-- having i.subtotal != (p.price * i.quantity)
