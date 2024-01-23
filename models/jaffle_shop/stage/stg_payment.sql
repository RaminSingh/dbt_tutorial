{{
    config (
        materialized ='incremental',
        unique_key='payment_id',
        merge_updated_columns =['STATUS']
    )
}}

SELECT
    ID as payment_id,
    ORDER_ID as order_id,
    PAYMENT_METHOD as pay_method,
    {{format_amount('AMOUNT')}} as AMOUNT,
    current_timestamp as record_timestamp
FROM {{source('jaffle_shop','payments')}}

{% if is_incremental()%}

    WHERE _BATCHED_AT > (SELECT MAX(record_timestamp) FROM {{this}})

{% endif%}