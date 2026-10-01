/*
Question: Photoshop Revenue Analysis - Adobe
URL: https://datalemur.com/questions/photoshop-revenue-analysis

Description:
For each customer that bought Photoshop, return their customer_id and their total spend across all Adobe products except Photoshop itself.

Table: customer_contracts (customer_id, product_name, amount)
*/

SELECT 
    customer_id,
    SUM(revenue) AS revenue
FROM
    adobe_transactions
WHERE
    product != 'Photoshop' AND
    customer_id IN (SELECT DISTINCT customer_id FROM adobe_transactions WHERE product = 'Photoshop')
GROUP BY
    customer_id;

/*
Explanation:
1. Identifies customers who bought 'Photoshop': WHERE customer_id IN (SELECT customer_id FROM customer_contracts WHERE product_name = 'Photoshop').
2. Calculates revenue from non-Photoshop products: WHERE product_name != 'Photoshop'.
3. Groups by customer_id and sums SUM(amount) AS revenue.
*/