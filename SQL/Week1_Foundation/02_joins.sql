---Day 2 Joins
--Show all orders with customer names.
--Display: customer_name, product_name, quantity, unit_price
--Only show orders where customer exists in both tables.

SELECT *
FROM orders;

SELECT *
FROM customers;


SELECT 
c.customer_name,
o.product_name,
o.quantity,
o.unit_price
FROM customers AS c  
INNER JOIN orders AS o ON c.customer_id = o.customer_id


--Show ALL customers, even those with no orders.
--Display: customer_name, city, product_name, status
--If a customer has no order, product_name should show NULL.

SELECT 
c.customer_name,
c.city,
o.product_name,
o.status
FROM customers AS c  
LEFT JOIN orders AS o ON c.customer_id = o.customer_id 

--Show total revenue per customer name.
--Only delivered orders.
--Display: customer_name, total_revenue
--Sort by total_revenue descending.

SELECT 
c.customer_name,
SUM(o.quantity * o.unit_price) AS total_revenue
FROM orders AS o INNER JOIN customers AS c ON c.customer_id = o.customer_id 
WHERE o.status = 'delivered'
GROUP BY c.customer_name
ORDER BY total_revenue DESC

--Using LEFT JOIN, find all customers who have never placed an order.
--Show: customer_name, city.
--Hint — use WHERE o.customer_id IS NULL

SELECT
c.customer_name,
c.city
FROM customers AS c LEFT JOIN orders AS o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL

--Drill 2
--Show total number of orders per customer.
--Show: customer_name, order_count.
--Include ALL customers even those with zero orders.
--Hint — LEFT JOIN + COUNT

SELECT 
c.customer_name,
COUNT(o.order_id) AS no_of_orders
FROM customers AS c LEFT JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY COUNT(o.order_id)

--Show each customer's most expensive single order.
--Show: customer_name, product_name, unit_price
--Hint — JOIN + ORDER BY + TOP

SELECT 
c.customer_name,
o.product_name,
o.unit_price

FROM customers AS c   JOIN orders AS o ON c.customer_id = o.customer_id


ORDER BY o.unit_price DESC 






 





