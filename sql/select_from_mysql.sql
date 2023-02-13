SELECT
     id as id_tran
    ,currency
    ,timestamp
    ,amount
    ,type
    ,created_at
    ,updated_at
FROM
    public.transactions
where
    timestamp = NOW()
