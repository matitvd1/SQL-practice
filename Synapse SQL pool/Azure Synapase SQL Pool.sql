-- CREATE master KEY

CREATE DATABASE scoped credential PolyDemoCredential
with
identity = 'SecretIdentity',
secret = '...';

CREATE EXTERNAL DATA SOURCE PolybaseDemoDataSource
WITH
(
    TYPE = HADOOP,
    LOCATION = 'wasbs://polybasedemo@demostorage.blob.core.windows.net/',
    CREDENTIAL = PolyDemoCredential
);


CREATE EXTERNAL FILE FORMAT polybasedemofileformat
WITH
(
    FORMAT_TYPE = DELIMITEDTEXT,
    FORMAT_OPTIONS (
        FIELD_TERMINATOR = ',',
        FIRST_ROW = 2)
);

CREATE EXTERNAL TABLE dbo.customer
(
    customerid int,
    customername VARCHAR(1000),
    city VARCHAR(1000)
)
WITH (
    LOCATION = '/',
    DATA_SOURCE = PolybaseDemoDataSource,
    FILE_FORMAT = polybasedemofileformat
)

SELECT * FROM customer;
