/*
Question: Market Analysis I
URL: https://leetcode.com/problems/market-analysis-i/

Description:
Find for each user, the join date and the number of orders they made as a buyer in 2019.

Tables: Users (user_id, join_date, favorite_brand), Orders (order_id, order_date, item_id, buyer_id, seller_id), Items (item_id, item_brand)
*/

SELECT
    L.user_id AS buyer_id,
    L.join_date,
    COALESCE(R.orders_in_2019, 0) orders_in_2019
FROM
    Users AS L
LEFT JOIN (
    SELECT 
         buyer_id,
         COUNT(1) AS orders_in_2019
    FROM
        Orders
    WHERE 
       YEAR(order_date) = 2019
    GROUP BY 1
) R
ON
    L.user_id = R.buyer_id
GROUP BY 1, 2
;

/*
Explanation:
1. Performs LEFT JOIN from Users u to Orders o on u.user_id = o.buyer_id AND YEAR(o.order_date) = 2019.
2. Filtering 2019 in the ON clause preserves users who made 0 orders in 2019.
3. Groups by u.user_id, u.join_date.
4. Counts COUNT(o.order_id) AS orders_in_2019.
*/