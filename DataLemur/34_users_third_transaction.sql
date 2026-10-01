/*
Question: User's Third Transaction - Uber
URL: https://datalemur.com/questions/sql-third-transaction

Description:
Retrieve the 3rd transaction for each user. Output user_id, spend, transaction_date.

Table: transactions
*/

SELECT
  user_id,
  spend,
  transaction_date
FROM (
SELECT
  user_id,
  spend,
  transaction_date,
  ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS trans_rank
FROM 
  transactions
) base
WHERE
  base.trans_rank = 3
;

/*
Explanation:
1. Windows transactions per user: ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY transaction_date ASC) AS rn.
2. Filters WHERE rn = 3.
3. Returns the third transaction attributes.
*/