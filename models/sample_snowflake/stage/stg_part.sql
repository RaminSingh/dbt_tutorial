
SELECT 
        P_PARTKEY as id,
        P_NAME as name,
        P_TYPE as type,
        current_timestamp as record_timestamp
    FROM {{source('sample','part')}}