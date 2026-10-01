/*
Question: Final Account Balance - PayPal
URL: https://datalemur.com/questions/final-account-balance

Description:
Given a table of bank transactions with transaction type ('Deposit' or 'Withdrawal'), write a query to calculate the final balance for each account.
Output account_id and final_balance.

Table: transactions (transaction_id, account_id, transaction_type, amount, transaction_date)
*/

SELECT
    account_id,
    SUM(
        CASE
            WHEN transaction_type = 'Deposit' THEN amount
            ELSE -amount
        END
    ) AS final_balance
FROM
    transactions
GROUP BY
    account_id;

/*
Explanation:
1. Uses conditional sum to add deposits and subtract withdrawals:
   SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE -amount END) AS final_balance.
2. Groups by ccount_id.
*/