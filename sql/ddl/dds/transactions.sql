CREATE TABLE dds.transactions (
     id NOT NULL PRIMARY KEY
    ,tran_id INTEGER
    ,currency VARCHAR(64)
    ,timestamp TIMESTAMP
    ,amount FLOAT(10)
    ,type VARCHAR(64)
    ,created_at TIMESTAMP
    ,updated_at TIMESTAMP
);

CREATE PROJECTION dds.transactions_super
AS SELECT * FROM dds.transactions
ORDER BY id
SEGMENTED BY hash(id) ALL NODES;

GRANT ALL PRIVILEGES ON TABLE dds.transactions TO user;
