/*
Question: Active User Retention - Facebook
URL: https://datalemur.com/questions/user-retention

Description:
Write a query to obtain the number of monthly active users (MAUs) in July 2022 who were also active in June 2022.
Active events include 'sign-in', 'like', or 'comment'.

Table: user_actions (user_id, event_id, event_type, event_date)
*/

SELECT
    DATE_PART('month', event_date) AS month,
    COUNT(DISTINCT user_id) AS monthly_active_users
FROM
    user_actions
WHERE
    user_id IN (SELECT DISTINCT user_id FROM user_actions WHERE DATE_PART('month', event_date) = 6) AND
    DATE_PART('month', event_date) = 7 AND
    event_type IN ('sign-in', 'like', 'comment')
GROUP BY
    DATE_PART('month', event_date);

/*
Explanation:
1. Filters July 2022 events: EXTRACT(MONTH FROM event_date) = 7 AND EXTRACT(YEAR FROM event_date) = 2022.
2. Checks if user_id IN (SELECT DISTINCT user_id FROM user_actions WHERE EXTRACT(MONTH FROM event_date) = 6 AND EXTRACT(YEAR FROM event_date) = 2022).
3. Counts COUNT(DISTINCT user_id) AS monthly_active_users.
*/