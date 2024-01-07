{{
    config (
        materialized ='incremental',
        unique_key='payment_id',
        merge_updated_columns =['STATUS']
    )
}}

SELECT
    ID as payment_id,
    ORDERID as order_id,
    PAYMENTMETHOD as pay_method,
    STATUS,
    {{format_amount('AMOUNT')}} as AMOUNT,
    current_timestamp as record_timestamp
FROM {{source('jaffle_shop','payment')}}

{% if is_incremental()%}

    WHERE _BATCHED_AT > (SELECT MAX(record_timestamp) FROM {{this}})

{% endif%}