{% snapshot orders_snapshot %}

    {{

        config(
            target_database='RETAIL_ANALYTICS',
            target_schema='snapshot',
            unique_key='id',

            strategy='timestamp',
            updated_at='order_date'
        )

    }}

    select * from {{source('jaffle_shop','orders')}}

{% endsnapshot%}