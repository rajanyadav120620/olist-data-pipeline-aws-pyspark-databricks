-- Doubt One
/*RULE IN DATABASES

👉 Parent table must be loaded first
👉 Child table must be loaded after

This is called Referential Integrity

✅ Correct Import Order (VERY IMPORTANT)

Follow this exact order:

1️⃣ customers
2️⃣ orders
3️⃣ products
4️⃣ sellers
5️⃣ order_items
6️⃣ order_payments
7️⃣ order_reviews
🚀 Why?

Because:

orders depends on customers

order_items depends on:

orders

products

sellers

payments depends on orders

reviews depends on orders*/

-- Doubt Second
/*Very Important Lesson

Before setting PRIMARY KEY:

Always check:

SELECT COUNT(review_id),
       COUNT(DISTINCT review_id)
FROM table_name;

If both numbers equal → unique
If not → cannot be primary key*/