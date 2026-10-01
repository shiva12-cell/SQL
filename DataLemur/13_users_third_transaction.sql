/*
Question: User's Third Transaction - Uber
URL: https://datalemur.com/questions/sql-third-transaction

Description:
Write a query to obtain the third transaction of every user.
Output the user_id, spend, and transaction_date.

Table: transactions (user_id, spend, transaction_date)
*/

WITH transactions_rank AS
(
    SELECT
        user_id,
        spend,
        transaction_date,
        DENSE_RANK() OVER (PARTITION BY user_id ORDER BY transaction_date ASC) AS ranking
    FROM
        transactions
)

SELECT
    user_id,
    spend,
    transaction_date
FROM
    transactions_rank
WHERE
    ranking = 3;

/*
Explanation:
1. Uses window function ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date ASC) as n in a CTE.
2. Filters where n = 3 in the outer query.
3. Selects user_id, spend, transaction_date.
*/