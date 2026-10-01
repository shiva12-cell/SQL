/*
Question: Repeat Purchases on Multiple Days - Stitch Fix
URL: https://datalemur.com/questions/sql-repeat-purchases

Description:
Identify the number of users who purchased the same product on multiple separate days.

Table: purchases (user_id, product_id, purchase_date)
*/

WITH purchases_by_users AS
(
    SELECT
        user_id,
        product_id, DATE(purchase_date),
        DENSE_RANK() OVER(PARTITION BY user_id, product_id ORDER BY DATE(purchase_date) ASC) AS purchase_num
    FROM
        purchases
)

SELECT
    COUNT(DISTINCT user_id) AS users_num
FROM
    purchases_by_users
WHERE
    purchase_num > 1;

/*
Explanation:
1. Groups by user_id, product_id.
2. Counts distinct purchase calendar dates: COUNT(DISTINCT DATE(purchase_date)).
3. Filters HAVING COUNT(DISTINCT DATE(purchase_date)) > 1.
4. Counts distinct users meeting this criterion.
*/