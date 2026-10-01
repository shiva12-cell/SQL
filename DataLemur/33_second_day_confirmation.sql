/*
Question: Second Day Confirmation - TikTok
URL: https://datalemur.com/questions/second-day-confirmation

Description:
Identify users who registered for an account and confirmed their registration on the second day (i.e. exactly 1 day after signup).

Tables: emails (email_id, user_id, signup_date), texts (text_id, email_id, signup_action, action_date)
*/

SELECT DISTINCT
    e.user_id
FROM
    emails AS e
    INNER JOIN texts AS t
    ON e.email_id = t.email_id
WHERE
    t.signup_action = 'Confirmed' AND
    DATE_PART('day', t.action_date - e.signup_date) = 1;

/*
Explanation:
1. Joins emails e and texts t on e.email_id = t.email_id.
2. Filters where t.signup_action = 'Confirmed'.
3. Matches second day: t.action_date = e.signup_date + INTERVAL '1 day' (or DATEDIFF(action_date, signup_date) = 1).
4. Projects unique user_id.
*/