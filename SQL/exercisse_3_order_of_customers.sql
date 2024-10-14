/*
Question 1: Total Orders Per Customer

Write a query to display the total number of orders placed by each customer, 
along with their name and the date they joined. Sort the results by the total number of orders in descending order.
*/
SELECT 
customers.customer_name,
customers.join_date,
count(orders.order_id) as total_nr_orders
FROM Customers
JOIN Orders 
on customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.customer_name, customers.join_date
ORDER BY total_nr_orders desc;


/*
Question 2: Rank Customers by Spending

For each customer, calculate their total spending (sum of the total amounts from the `Orders` table) 
and rank them by total spending within their respective country. 
Use a **window function** to rank the customers.
*/


SELECT
Customers.customer_id,
Customers.country,
SUM(orderitems.quantity * orderitems.price) as total_spending,
RANK() OVER (PARTITION BY Customers.country order by total_spending desc) as ranking
FROM Customers
JOIN Orders
    on customers.customer_id = orders.customer_id
JOIN OrderItems
    on orders.order_id = orderitems.order_id
GROUP BY Customers.customer_id, Customers.customer_name, Customers.country
ORDER BY customers.country, ranking;