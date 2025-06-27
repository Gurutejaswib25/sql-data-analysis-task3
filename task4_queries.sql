-- 1. WHERE Clause: Orders with revenue greater than 150
SELECT * 
FROM orders
WHERE revenue > 150;
-- 1. HAVING Clause: Customers with total revenue > 400
SELECT customer_id, SUM(revenue) AS total_revenue
FROM orders
GROUP BY customer_id
HAVING total_revenue > 400;
-- 2. INNER JOIN: Customers who have placed orders
SELECT c.name, o.order_date, o.revenue
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;
-- 2. LEFT JOIN: All customers and their orders (if any)
SELECT c.name, o.order_date, o.revenue
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;
-- 3. Average Revenue Per User
SELECT customer_id, AVG(revenue) AS avg_revenue
FROM orders
GROUP BY customer_id;
-- 4. Subquery: Customers whose total revenue > average revenue
SELECT name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING SUM(revenue) > (
        SELECT AVG(revenue)
        FROM orders
    )
);
-- 5. SQL Optimization: Create index on customer_id
CREATE INDEX IF NOT EXISTS idx_customer_id ON orders(customer_id);
-- 6. Create a View: Customer order summary
CREATE VIEW IF NOT EXISTS customer_order_view AS
SELECT c.customer_id, c.name, o.order_id, o.order_date, o.revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;
-- 6. Query the view for high-value orders
SELECT * 
FROM customer_order_view
WHERE revenue > 200;
-- 7. Insert a customer with NULL age
INSERT INTO customers (name, age, city)
VALUES ('NullTest', NULL, 'Unknown City');
-- 7. Insert a customer with NULL age
SELECT * 
FROM customers 
WHERE age IS NULL;
-- 7. Use COALESCE to replace NULL age with 0
SELECT name, COALESCE(age, 0) AS age_handled
FROM customers;




