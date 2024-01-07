{{
    config (
        materialized='table'
    )
}}
SELECT 
        id as customer_id,
        first_name,
        last_name,
        current_timestamp as record_timestamp
    FROM {{source('jaffle_shop','customers')}}