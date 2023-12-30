
-- Test de qualité des données pour le taux de taxe

SELECT
    tax_rate
FROM
    {{ ref('stores','s') }}
WHERE
    s.tax_rate < 0 OR s.tax_rate > 1