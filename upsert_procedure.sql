USE datagrokr_de_pipeline;

DELIMITER //

CREATE PROCEDURE ProcessSalesUpsert(
IN p_sales_id INT,
IN p_customer_id INT,
IN p_product_id INT,
IN p_sale_date DATE,
IN p_quantity INT,
IN p_amount DECIMAL(10,2)
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
ROLLBACK;
RESIGNAL;
END;

```
START TRANSACTION;

INSERT INTO fact_sales
(sales_id, customer_id, product_id, sale_date, quantity, amount)
VALUES
(p_sales_id, p_customer_id, p_product_id,
 p_sale_date, p_quantity, p_amount)

ON DUPLICATE KEY UPDATE
    customer_id = VALUES(customer_id),
    product_id = VALUES(product_id),
    quantity = VALUES(quantity),
    amount = VALUES(amount);

COMMIT;
```

END //

DELIMITER ;

-- Test the procedure with a new sales transaction
CALL ProcessSalesUpsert(
6, 103, 201, '2025-03-01', 2, 3000.00
);

-- Display the inserted transaction
SELECT *
FROM fact_sales
WHERE sales_id = 6;
