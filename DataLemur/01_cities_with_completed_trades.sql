/*
Question: Cities With Completed Trades - Robinhood
URL: https://datalemur.com/questions/completed-trades

Description:
Write a query to retrieve the top three cities that have the highest number of completed trade orders.
Output the city name and the number of completed orders. Order the results by total orders in descending order.

Tables: trades (order_id, user_id, price, quantity, status, transaction_date), users (user_id, city, email, signup_date)
*/

SELECT
    u.city,
    COUNT(t.order_id) AS total_orders
FROM
    trades AS t 
    INNER JOIN users AS u
    ON t.user_id = u.user_id
WHERE
    t.status = 'Completed'
GROUP BY
    u.city
ORDER BY
    total_orders DESC
LIMIT 3;

/*
Explanation:
1. Joins trades t with users u on t.user_id = u.user_id.
2. Filters where t.status = 'Completed'.
3. Groups by u.city and calculates COUNT(t.order_id) AS total_orders.
4. Orders by total_orders DESC and limits to top 3 (LIMIT 3).
*/