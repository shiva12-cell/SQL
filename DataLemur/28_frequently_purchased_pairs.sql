/*
Question: Frequently Purchased Pairs - Walmart
URL: https://datalemur.com/questions/frequently-purchased-pairs

Description:
Identify product pairs that are frequently bought together within the same order transaction.

Table: order_products
*/

SELECT
  COUNT(DISTINCT(product_pairs))
FROM (
SELECT 
  transaction_id, 
  ARRAY_AGG(product_id) AS product_pairs
FROM 
  transactions
GROUP BY transaction_id
) BASE
WHERE
  ARRAY_LENGTH(product_pairs,1) > 1
;

/*
Explanation:
1. Self-joins order_products p1 and order_products p2 on p1.order_id = p2.order_id AND p1.product_id < p2.product_id.
2. p1.product_id < p2.product_id prevents duplicate inverted pairs (A, B) vs (B, A) and self-pairing (A, A).
3. Groups by p1.product_id, p2.product_id and orders by co-occurrence count descending.
*/