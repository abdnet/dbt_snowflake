-- Test pour vérifier que la colonne TOTAL_ORDERS correspond au nombre d'ordres dans
-- la table orders
{{ config(
    severity="warn",
    test_name="QUALITY_DIM_COMPLETENESS_CUSTOMERS2")

    
     }}
select c.id, c.total_orders, count(o.id) as orders_count
from {{ ref("customers") }} c
join {{ ref("orders") }} o on c.id = o.customer
group by 1, 2
having c.total_orders != orders_count
