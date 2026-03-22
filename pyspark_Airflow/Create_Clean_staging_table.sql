--Step 1 — Create Clean Orders Table (Staging)
CREATE TABLE staging.orders_clean AS
SELECT
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp::timestamp AS order_purchase_ts,
    o.order_approved_at::timestamp AS order_approved_ts,
    o.order_delivered_customer_date::timestamp AS delivered_customer_ts,
    o.order_estimated_delivery_date::timestamp AS estimated_delivery_ts
FROM raw.orders o
WHERE o.order_id IS NOT NULL;
--Step 2 — Create Clean Order Items
CREATE TABLE staging.order_items_clean AS
SELECT
    order_id,
    product_id,
    seller_id,
    price,
    freight_value
FROM raw.order_items
WHERE order_id IS NOT NULL;