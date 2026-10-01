/*
Question: Repeated Payments - Stripe
URL: https://datalemur.com/questions/repeated-payments

Description:
Identify repeated payments made by the same customer to the same merchant for the same amount within 10 minutes of each other.
Count the total number of such repeated transactions.

Table: transactions (transaction_id, merchant_id, credit_card_id, amount, transaction_timestamp)
*/

WITH crossjoin AS ( 
SELECT
  L.merchant_id,
  L.credit_card_id,
  L.amount,
  ABS(EXTRACT(MINS FROM L.transaction_timestamp - R.transaction_timestamp)) AS diff
FROM 
  transactions AS L
LEFT JOIN
  transactions AS R
ON (
  L.merchant_id = R.merchant_id
AND 
  L.credit_card_id = R.credit_card_id
AND
  L.amount = R.amount)
)

SELECT 
  COUNT(1) payment_count
FROM (
SELECT
  merchant_id,
  credit_card_id,
  amount,
  row_number() OVER(PARTITION BY merchant_id, credit_card_id, amount, diff ORDER BY diff ASC) AS TXN_NUM  
FROM 
  crossjoin
WHERE
  0 < diff -- Exclude comparing transaction to self
AND 
  diff < 10 -- within 10 minutes 
) BASE
WHERE 
  TXN_NUM != 1 -- exclude the first one since doesnt count as repeated transaction

/*
Explanation:
1. Uses window function LAG(transaction_timestamp) OVER (PARTITION BY merchant_id, credit_card_id, amount ORDER BY transaction_timestamp) to inspect the preceding transaction time.
2. Calculates the minute difference between consecutive matching transactions.
3. Filters where interval <= 10 minutes.
4. Counts qualifying repeat transactions: COUNT(*).
*/