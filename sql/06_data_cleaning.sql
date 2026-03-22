--Find Duplicate Records
--Customers Duplicate Check
SELECT customer_id, COUNT(*)
FROM olist_customers_dataset
GROUP BY customer_id
HAVING COUNT(*) > 1;

--Orders Duplicate Check
SELECT order_id, COUNT(*)
FROM olist_orders_dataset
GROUP BY order_id
HAVING COUNT(*) > 1;

--Order Items Duplicate Check
SELECT order_id, order_item_id, COUNT(*)
FROM olist_order_items_dataset
GROUP BY order_id, order_item_id
HAVING COUNT(*) > 1;

--Handle NULL Category
UPDATE olist_products_dataset
SET product_category_name = 'unknown'
WHERE product_category_name IS NULL;

--Remove Logical Delivery Errors
DELETE FROM olist_orders_dataset
WHERE order_delivered_customer_date < order_purchase_timestamp;

--Remove Duplicate Customers (if any)
DELETE FROM olist_customers_dataset a
USING olist_customers_dataset b
WHERE a.ctid < b.ctid
AND a.customer_id = b.customer_id;


