{{ config(
    materialized='view'
) }}

-- A view does not store data physically. 
-- It is just a saved query that executes every time someone queries it.
SELECT 
    customer_id,
    first_name,
    last_name,
    email,
    CURRENT_TIMESTAMP AS updated_at
FROM {{ source('raw_data', 'customers') }}
WHERE is_active = true
