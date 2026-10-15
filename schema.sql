-- Project: Enterprise Data Engineering SQL Pipeline
-- Database: MySQL 8.0+

DROP DATABASE IF EXISTS datagrokr_de_pipeline;

CREATE DATABASE datagrokr_de_pipeline;

USE datagrokr_de_pipeline;

-- 1. Customer dimension table
CREATE TABLE dim_customer (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
email VARCHAR(100),
segment VARCHAR(50),
effective_date DATE,
end_date DATE,
is_current BOOLEAN DEFAULT TRUE
);

-- 2. Product dimension table with JSON attributes
CREATE TABLE dim_product (
product_id INT PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
category VARCHAR(50),
price DECIMAL(10,2),
attributes JSON
);

-- 3. Partitioned sales fact table
CREATE TABLE fact_sales (
sales_id INT NOT NULL,
customer_id INT NOT NULL,
product_id INT NOT NULL,
sale_date DATE NOT NULL,
quantity INT NOT NULL,
amount DECIMAL(10,2) NOT NULL,
PRIMARY KEY (sales_id, sale_date)
)
PARTITION BY RANGE (YEAR(sale_date)) (
PARTITION p2023 VALUES LESS THAN (2024),
PARTITION p2024 VALUES LESS THAN (2025),
PARTITION p2025 VALUES LESS THAN (2026),
PARTITION p_future VALUES LESS THAN MAXVALUE
);

-- 4. Audit log table
CREATE TABLE sales_audit_log (
log_id INT AUTO_INCREMENT PRIMARY KEY,
sales_id INT,
action_type VARCHAR(50),
logged_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5. Indexes for sales queries
CREATE INDEX idx_sales_customer
ON fact_sales(customer_id);

CREATE INDEX idx_sales_cust_date
ON fact_sales(customer_id, sale_date);
