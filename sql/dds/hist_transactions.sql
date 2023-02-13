WITH cte AS (
    SELECT 
         id_tran
        ,currency
        ,timestamp
        ,amount
        ,type
        ,created_at
        ,updated_at
    FROM stg.transactions
    LIMIT 1 OVER (PARTITION BY id_tran ORDER BY updated_at DESC)
)

MERGE INTO dds.hist_transactions A
USING stg.transactions B
ON (A.id_tran=B.id_tran)
WHEN MATCHED THEN 
    UPDATE SET A.last_txn_dt = B.updated_at
WHEN NOT MATCHED THEN 
    INSERT (id_tran, first_txn, last_txn_dt) VALUES (B.id_tran, B.created_at, B.updated_at)
