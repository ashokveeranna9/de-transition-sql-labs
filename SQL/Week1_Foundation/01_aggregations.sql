-- Week 1 Day 1
-- Topic: Aggregations

--total sales of orders
SELECT SUM(sales) AS total_sales
FROM dbo.orders;

--Count how many orders each customer placed.

SELECT customer_id, COUNT(order_id) AS orders_placed
FROM dbo.orders
GROUP BY customer_id;

--Retrieve all delivered orders.
--Show: order_id, product_name, unit_price
SELECT  order_id, product_name, unit_price
FROM orders
WHERE status = 'delivered' ;

--Show all orders with a new column called total_value
--total_value = quantity × unit_price
--Sort by total_value descending

SELECT quantity, unit_price,
(unit_price * quantity) AS total_value
FROM orders
ORDER BY total_value DESC

--Show only Electronics orders
-- where total_value (quantity × unit_price) is greater than 10,000
SELECT 
product_name,
category,
quantity,
unit_price,
(quantity * unit_price) AS total_value
FROM orders
WHERE category = 'Electronics'
AND (quantity * unit_price) > 10000

--Find total revenue per category
--Only for delivered orders
--Show: category, total_revenue
--Sort: highest first

SELECT category,
SUM(quantity * unit_price) AS total_revenue
FROM orders
WHERE status = 'delivered'
GROUP BY category
ORDER BY total_revenue DESC

--Count how many orders exist per status type.
--Show: status, order_count. Sort by order_count descending.

SELECT 
status,
COUNT(order_id) AS order_count
FROM orders
GROUP BY status
ORDER BY COUNT(order_id) DESC

--Find the single most expensive product by unit_price.
--Show: product_name, unit_price.
SELECT TOP 1 product_name, unit_price
FROM orders
ORDER BY unit_price DESC

--Show all orders placed by customer_id 201.
--Sort by order_date ascending.

SELECT 
customer_id,
product_name,
order_date
FROM orders
WHERE customer_id = 201 
ORDER BY order_date ASC