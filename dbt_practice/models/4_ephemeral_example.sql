{{ config(
    materialized='ephemeral'
) }}

-- Ephemeral models do not exist as tables or views in the database.
-- Instead, dbt injects this SQL as a Common Table Expression (CTE) into any model that references it.
SELECT 
    product_id,
    LOWER(product_category) AS normalized_category,
    price * 1.20 AS price_with_tax
FROM {{ source('raw_data', 'products') }}
WHERE is_discontinued = false
