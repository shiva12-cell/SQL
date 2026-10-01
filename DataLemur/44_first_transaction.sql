/*
Question: First Transaction - Etsy
URL: https://datalemur.com/questions/sql-first-transaction

Description:
Write a query to find the first transaction details for each user on the Etsy platform.
Output user_id, spend, and transaction_date.

Table: user_transactions
*/

WITH transaction_ranking AS
(
    SELECT
        user_id,
        spend,
        transaction_date,
        DENSE_RANK() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS transaction_num
    FROM
        user_transactions
)

SELECT
    COUNT(DISTINCT user_id) AS users
FROM
    transaction_ranking
WHERE
    transaction_num = 1 AND spend >= 50;

/*
Explanation:
1. Uses window function ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date ASC) as n.
2. Filters where n = 1.
3. Selects the user's initial purchase record.
*/