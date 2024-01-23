{{
    config(
        post_hook="GRANT SELECT ON {{this}} TO ROLE DE_ANALYST"
    )
}}
SELECT 
        PS_PARTKEY as partid,
        PS_SUPPKEY as supplierid,
        PS_AVAILQTY as quantity,
        current_timestamp as record_timestamp
    FROM {{source('sample','partsupp')}}