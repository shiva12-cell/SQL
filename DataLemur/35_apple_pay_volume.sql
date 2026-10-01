/*
Question: Apple Pay Volume - Visa
URL: https://datalemur.com/questions/apple-pay-volume

Description:
Calculate the total transaction volume processed via Apple Pay for each merchant.
Display merchant name and total volume, ordered by volume descending.

Table: transactions (merchant_id, payment_method, amount)
*/

SELECT
    merchant_id,
    SUM(
        CASE
        WHEN LOWER(payment_method) = 'apple pay' THEN transaction_amount
        ELSE 0
        END
    ) AS volume
FROM
    transactions
GROUP BY
    merchant_id
ORDER BY
    volume DESC;

/*
Explanation:
1. Filters payments where payment_method = 'Apple Pay' or uses conditional sum.
2. Groups by merchant_id.
3. Sums SUM(amount) AS total_volume.
4. Orders by total_volume DESC.
*/