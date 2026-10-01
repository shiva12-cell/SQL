/*
Question: Same Week Purchases - Etsy
URL: https://datalemur.com/questions/same-week-purchases

Description:
Find the percentage of users who made another purchase within 7 days of their initial signup/purchase date.

Tables: signups, user_transactions
*/

WITH user_count_tbl AS
(
    SELECT
        COUNT(DISTINCT up.user_id) AS total_purchase_users,
        COUNT(DISTINCT s.user_id) AS total_signup_users
    FROM
        signups AS s
        LEFT OUTER JOIN user_purchases AS up
        ON s.user_id = up.user_id
    WHERE
        up.purchase_date IS NULL OR
        up.purchase_date BETWEEN s.signup_date AND (s.signup_date + '1 week'::INTERVAL)
)

SELECT
    ROUND(
        100 * 
        (total_purchase_users::NUMERIC / total_signup_users), 
        2
    ) AS single_purchase_pct
FROM
    user_count_tbl;

/*
Explanation:
1. Identifies each user's signup/first purchase date.
2. Checks if user has a second purchase where purchase_date BETWEEN first_date AND first_date + INTERVAL '7 days'.
3. Computes conversion percentage: ROUND(100.0 * repeat_users / total_users, 2).
*/