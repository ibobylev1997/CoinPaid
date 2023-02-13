CREATE TABLE dds.hist_transactions (
    id NOT NULL PRIMARY KEY
    ,tran_id INTEGER
    ,first_txn_date TIMESTAMP
    ,last_txn_date TIMESTAMP
);

CREATE PROJECTION dds.hist_transactions_super
AS SELECT * FROM dds.hist_transactions
ORDER BY id
SEGMENTED BY hash(id) ALL NODES;

GRANT ALL PRIVILEGES ON TABLE dds.hist_transactions TO user;
