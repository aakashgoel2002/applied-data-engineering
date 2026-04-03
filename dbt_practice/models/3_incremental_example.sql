{{ config(
    materialized='incremental',
    unique_key='event_id'
) }}

-- Incremental models only process NEW data since the last run.
-- Much faster than rebuilding a table, but more complex logic.
SELECT 
    event_id,
    user_id,
    event_type,
    event_timestamp
FROM {{ source('logging', 'website_events') }}

{% if is_incremental() %}

  -- This filter only applies on subsequent runs, NOT the very first run.
  -- It grabs only events that happened AFTER the latest timestamp in the existing table.
  WHERE event_timestamp > (SELECT MAX(event_timestamp) FROM {{ this }})

{% endif %}
