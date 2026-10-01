/*
Question: Highest Number of Products - eBay
URL: https://datalemur.com/questions/sql-highest-products

Description:
Find the total spend for users who purchased the highest number of distinct products or multiple product tiers.

Table: user_transactions
*/

SELECT
    user_id,
    product_sum
FROM
(
    SELECT
        user_id,
        COUNT(product_id) AS product_sum,
        SUM(spend) AS total_spend
    FROM
        user_transactions
    GROUP BY
        user_id
) AS temp_tbl
WHERE
    total_spend >= 1000
ORDER BY
    product_sum DESC,
    total_spend DESC
LIMIT 3;

/*
Explanation:
1. Aggregates product count and total spend per user.
2. Filters or ranks users based on number of products purchased.
3. Returns the spend metrics for top user cohorts.
*/