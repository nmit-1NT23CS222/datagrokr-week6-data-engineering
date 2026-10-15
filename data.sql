USE datagrokr_de_pipeline;

-- 1. Insert customer records
INSERT INTO dim_customer
(customer_id, customer_name, email, segment, effective_date, end_date, is_current)
VALUES
(101, 'Ananya Rao', '[ananya@company.com](mailto:ananya@company.com)', 'Enterprise', '2023-01-01', NULL, TRUE),
(102, 'Rahul Sharma', '[rahul@company.com](mailto:rahul@company.com)', 'Retail', '2023-01-01', NULL, TRUE),
(103, 'Priya Nair', '[priya@company.com](mailto:priya@company.com)', 'SMB', '2023-01-01', NULL, TRUE);

-- 2. Insert product records
INSERT INTO dim_product
(product_id, product_name, category, price, attributes)
VALUES
(201, 'Cloud Data Platform', 'Software', 1500.00,
'{"tier": "Gold", "support": "24/7"}'),

(202, 'Analytics Engine', 'Software', 800.00,
'{"tier": "Silver", "support": "Business"}'),

(203, 'ETL Pipeline Builder', 'Tools', 450.00,
'{"tier": "Bronze", "support": "Standard"}');

-- 3. Insert sales transactions
INSERT INTO fact_sales
(sales_id, customer_id, product_id, sale_date, quantity, amount)
VALUES
(1, 101, 201, '2023-05-15', 2, 3000.00),
(2, 102, 202, '2023-11-20', 1, 800.00),
(3, 103, 203, '2024-02-10', 4, 1800.00),
(4, 101, 202, '2024-06-18', 3, 2400.00),
(5, 102, 201, '2025-01-12', 1, 1500.00);
