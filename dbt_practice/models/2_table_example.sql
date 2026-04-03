{{ config(
    materialized='table'
) }}

-- A table physically stores the computed data.
-- Every time you run `dbt run`, it totally drops the old table and rebuilds it from scratch.
SELECT 
    user_id,
    COUNT(order_id) AS total_orders,
    SUM(order_value) AS lifetime_value,
    MAX(order_date) AS last_purchase_date
FROM {{ ref('1_view_example') }} -- Referring to another model
GROUP BY user_id
