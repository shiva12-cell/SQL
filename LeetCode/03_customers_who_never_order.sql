/*
Question: Customers who never order
URL: https://leetcode.com/problems/customers-who-never-order/

Description:
Find all customers who never order anything.

Table: Customers (id INT, name VARCHAR)
Table: Orders (id INT, customerId INT)
customerId is a foreign key referring to Customers.id.
*/

SELECT Name 
FROM 
	(SELECT Name, CustomerId
	 FROM Customers
	 LEFT JOIN
	 Orders
	 ON (Customers.Id = Orders.CustomerId) 
	) Temp
WHERE Temp.CustomerId IS NULL;


SELECT name As Customers
FROM Customers
WHERE Customers.Id NOT IN
(SELECT DISTINCT(CustomerId)
 FROM Orders)
;

/*
Explanation:
1. Method 1 (LEFT JOIN): Performs LEFT JOIN Orders ON Customers.id = Orders.customerId and filters with WHERE Orders.id IS NULL.
2. Method 2 (NOT IN / NOT EXISTS): WHERE id NOT IN (SELECT customerId FROM Orders WHERE customerId IS NOT NULL).
3. Projects Customers.name AS Customers.
*/