
SELECT 
        S_SUPPKEY as id,
        S_NAME as name,
        S_ADDRESS as address,
        current_timestamp as record_timestamp
    FROM {{source('sample','supplier')}}