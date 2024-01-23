
SELECT 
        C_CUSTKEY AS id,
        C_NAME AS name,
        C_ADDRESS as address,
        current_timestamp as record_timestamp
    FROM {{source('sample','customer')}}