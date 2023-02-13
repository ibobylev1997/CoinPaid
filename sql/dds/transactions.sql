INSERT INTO dds.transactions
SELECT
     id
    ,tran_id
    ,currency
    ,timestamp
    ,amount
    ,type
    ,created_at
    ,updated_at
FROM stg.transactions
