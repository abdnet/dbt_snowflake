-- Test d'intégration pour la relation avec les commandes
SELECT
    store_id
FROM
    {{ ref('orders') }} orders
LEFT JOIN
    {{ ref('stores') }} stores ON orders.store_id = stores.id
WHERE
    stores.id IS NULL
    OR orders.store_id IS NULL