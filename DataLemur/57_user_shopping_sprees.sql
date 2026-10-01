/*
Question: User Shopping Sprees - Amazon
URL: https://datalemur.com/questions/amazon-shopping-spree

Description:
In an Amazon shopping spree, a user makes purchases on three or more consecutive days.
Write a query to identify the user_ids of users who have gone on a shopping spree, ordered by user_id.

Table: transactions (user_id, amount, transaction_date)
*/

WITH shopping_spree_transactions AS
(
    SELECT
        user_id,
        transaction_date,
        CASE
        WHEN
            LEAD(transaction_date, 1) OVER (PARTITION BY user_id ORDER BY transaction_date ASC) = (transaction_date +  INTERVAL '1 day')
            AND
            LEAD(transaction_date, 2) OVER (PARTITION BY user_id ORDER BY transaction_date ASC) = (transaction_date +  INTERVAL '2 days')
        THEN
            1
        ELSE 0
        END AS shopping_spree_flag
    FROM
        transactions
)

SELECT DISTINCT
    user_id
FROM
    shopping_spree_transactions
WHERE
    shopping_spree_flag = 1
ORDER BY
    user_id ASC;

/*
Explanation:
1. Eliminates multiple transactions per day with SELECT DISTINCT user_id, DATE(transaction_date) AS txn_date.
2. Uses window functions LEAD(txn_date, 1) and LEAD(txn_date, 2) partitioned by user_id ordered by txn_date.
3. Checks if 
ext_date = txn_date + INTERVAL '1 day' AND next_next_date = txn_date + INTERVAL '2 days'.
4. Selects distinct user_id ordered by user_id ASC.
*/