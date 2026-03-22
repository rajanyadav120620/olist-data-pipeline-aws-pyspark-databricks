
--Business Insight:Total money company earned.
--Total Revenue
SELECT SUM(payment_value) AS total_revenue
FROM olist_order_payments_dataset;

--Total Orders
SELECT COUNT(*) AS total_orders
FROM olist_orders_dataset;
--Business Insight:Order volume.
--Order volume.

--Top 10 Products by Revenue
SELECT 
    oi.product_id,
    SUM(oi.price) AS revenue
FROM olist_order_items_dataset oi
GROUP BY oi.product_id
ORDER BY revenue DESC
LIMIT 10;

--Business Insight:Best selling products.

--Revenue by Month
SELECT 
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    SUM(p.payment_value) AS revenue
FROM olist_orders_dataset o
JOIN olist_order_payments_dataset p
ON o.order_id = p.order_id
GROUP BY month
ORDER BY month;

--Business Insight:Growth trend.

--Top Customers by Spending
SELECT 
    c.customer_id,
    SUM(p.payment_value) AS total_spent
FROM olist_customers_dataset c
JOIN olist_orders_dataset o ON c.customer_id = o.customer_id
JOIN olist_order_payments_dataset p ON o.order_id = p.order_id
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 10;

--Business Insight:High value customers.

-- INTERMEDIATE ANALYSIS 
--Average Order Value
SELECT 
    SUM(payment_value) / COUNT(DISTINCT order_id) AS avg_order_value
FROM olist_order_payments_dataset;

--Repeat Customers
SELECT customer_id,
       COUNT(order_id) AS total_orders
FROM olist_orders_dataset
GROUP BY customer_id
HAVING COUNT(order_id) > 1;

--Business Meaning:Customer retention indicator.

--Revenue by Product Category
SELECT 
    p.product_category_name,
    SUM(oi.price) AS revenue
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p
ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC;

--Business Meaning:Which category drives revenue.

--ADVANCED SQL 

--Now we move to Data Engineer + Analyst level.

--Customer Lifetime Value Ranking
SELECT 
    c.customer_id,
    SUM(p.payment_value) AS total_spent,
    RANK() OVER (ORDER BY SUM(p.payment_value) DESC) AS rank_position
FROM olist_customers_dataset c
JOIN olist_orders_dataset o ON c.customer_id = o.customer_id
JOIN olist_order_payments_dataset p ON o.order_id = p.order_id
GROUP BY c.customer_id;

--Running Monthly Revenue
SELECT 
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    SUM(p.payment_value) AS monthly_revenue,
    SUM(SUM(p.payment_value)) 
        OVER (ORDER BY DATE_TRUNC('month', o.order_purchase_timestamp)) 
        AS running_total
FROM olist_orders_dataset o
JOIN olist_order_payments_dataset p 
ON o.order_id = p.order_id
GROUP BY month
ORDER BY month;