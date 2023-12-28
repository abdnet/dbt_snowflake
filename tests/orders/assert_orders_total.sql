-- Assert que le calcul de ORDER_TOTAL est correct en tenant compte du taux de taxe du magasin

{{ config(severity="warn") }}

WITH calculated_order_totals AS (
    SELECT
        o.ID,
        o.SUBTOTAL,
        o.TAX_PAID,
        s.TAX_RATE,
        o.SUBTOTAL * (1+ s.TAX_RATE) AS expected_order_total,
        o.ORDER_TOTAL
    FROM
        {{ ref('orders') }} o
    JOIN
        {{ ref('stores') }} s ON o.STORE_ID = s.ID
)

SELECT
    ID,
    SUBTOTAL,
    TAX_PAID,
    TAX_RATE,
    expected_order_total,
    ORDER_TOTAL
FROM
    calculated_order_totals
WHERE
    abs(ORDER_TOTAL- expected_order_total)>=1
