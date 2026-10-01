/*
Question: Supercloud Customer - Microsoft
URL: https://datalemur.com/questions/supercloud-customer

Description:
A Supercloud customer is defined as a customer who has purchased at least one product from every distinct product category available.
Write a query to identify customer_id of Supercloud customers.

Tables: customer_contracts (customer_id, product_id, amount), products (product_id, product_category, product_name)
*/

WITH cat_combos AS (
SELECT
  L.customer_id,
  R.product_category
FROM 
  customer_contracts AS L
LEFT JOIN
  products AS R
ON
  L.product_id = R.product_id
GROUP BY 1, 2
)


SELECT 
  customer_id
FROM (
  SELECT 
    customer_id,
    COUNT(1) AS category_ct
  FROM
    cat_combos
  GROUP BY 1
  HAVING COUNT(1)  = (SELECT COUNT(DISTINCT(product_category)) FROM products)
) base

/*
Explanation:
1. Joins customer_contracts c to products p on c.product_id = p.product_id.
2. Groups by c.customer_id.
3. Checks if the count of distinct categories purchased equals the total number of distinct categories available:
   HAVING COUNT(DISTINCT p.product_category) = (SELECT COUNT(DISTINCT product_category) FROM products).
*/