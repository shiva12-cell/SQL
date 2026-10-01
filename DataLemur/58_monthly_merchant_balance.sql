/*
Question: Monthly Merchant Balance - Visa
URL: https://datalemur.com/questions/sql-monthly-merchant-balance

Description:
Calculate the net balance for each merchant at the end of every month by aggregating transaction amounts and deducting refunds/chargebacks.

Table: transactions (transaction_id, merchant_id, type, amount, transaction_timestamp)
*/

WITH signed_transactions AS
(
    SELECT
        DATE(transaction_date) AS transaction_date,
        CASE
        WHEN type = 'deposit' THEN amount
        ELSE -amount
        END AS amount
    FROM
        transactions
),

daily_balance_details AS
(
    SELECT
        transaction_date AS transaction_day,
        DATE_PART('month', transaction_date) AS month,
        SUM(amount) AS daily_balance
    FROM
        signed_transactions
    GROUP BY
        transaction_date,
        DATE_PART('month', transaction_date)
)

SELECT
    transaction_day,
    SUM(daily_balance) OVER (PARTITION BY month ORDER BY transaction_day ASC) AS balance
FROM 
    daily_balance_details
ORDER BY
    transaction_day ASC;

/*
Explanation:
1. Extracts year and month from timestamp.
2. Sums net amount: SUM(CASE WHEN type = 'deposit' THEN amount WHEN type = 'refund' THEN -amount ELSE 0 END) AS net_balance.
3. Groups by merchant_id, EXTRACT(YEAR FROM timestamp), EXTRACT(MONTH FROM timestamp).
*/