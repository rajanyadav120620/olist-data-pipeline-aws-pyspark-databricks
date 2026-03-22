-- Table 1 Customer
CREATE TABLE raw.customers (
    customer_id TEXT,
    customer_unique_id TEXT,
    customer_zip_code_prefix INT,
    customer_city TEXT,
    customer_state TEXT
);

SELECT COUNT(*) FROM raw.customers;
-- Table 2