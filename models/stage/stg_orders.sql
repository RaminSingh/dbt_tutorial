{{
    config (
        materialized='incremental',
        unique_key='order_id',
        incremental_strategy='merge'
        
    )
}}
    SELECT
        id as order_id,
        user_id as customer_id,
        order_date,
        status,
        current_timestamp as record_timestamp
    FROM {{source('jaffle_shop','orders')}}

    {% if is_incremental() %}

        WHERE _etl_loaded_at > (select max(record_timestamp) from {{this}})

    {% endif%}