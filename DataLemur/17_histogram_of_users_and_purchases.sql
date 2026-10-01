/*
Question: Histogram of Users and Purchases - Walmart
URL: https://datalemur.com/questions/histogram-users-purchases

Description:
Write a query to obtain the number of products purchased by users on their most recent transaction date.
Output the user's most recent transaction date, user ID, and the number of products.
Sort the results by transaction date in chronological order.

Table: user_transactions (product_id, user_id, spend, transaction_date)
*/

WITH latest_transactions AS
(
    SELECT
        transaction_date,
        user_id,
        product_id,
        DENSE_RANK() OVER (PARTITION BY user_id ORDER BY transaction_date DESC) AS latest_purchase
    FROM 
        user_transactions
)

SELECT
    transaction_date,
    COUNT(DISTINCT user_id) AS number_of_users,
    SUM(latest_purchase) AS number_of_products
FROM
    latest_transactions
WHERE
    latest_purchase = 1
GROUP BY
    transaction_date
ORDER BY
    transaction_date;

/*
Explanation:
1. Uses window function DENSE_RANK() OVER (PARTITION BY user_id ORDER BY transaction_date DESC) as ank in a CTE.
2. Filters rows where ank = 1 (the user's latest transaction date).
3. Groups by transaction_date, user_id and counts COUNT(product_id) AS purchase_count.
4. Orders by transaction_date ASC.
*/