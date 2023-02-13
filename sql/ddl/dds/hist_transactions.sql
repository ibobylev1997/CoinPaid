CREATE TABLE dds.hist_transactions (
    id NOT NULL PRIMARY KEY
    ,first_txn_date TIMESTAMP
    ,last_txn_date TIMESTAMP
    ,status VARCHAR(64)
);

CREATE PROJECTION dds.hist_transactions_super
AS SELECT * FROM dds.hist_transactions
ORDER BY id
SEGMENTED BY hash(id) ALL NODES;

GRANT ALL PRIVILEGES ON TABLE dds.hist_transactions TO user;