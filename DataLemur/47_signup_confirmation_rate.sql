/*
Question: Signup Confirmation Rate - TikTok
URL: https://datalemur.com/questions/signup-confirmation-rate

Description:
Calculate the TikTok signup confirmation rate.
Signup confirmation rate = (confirmed users) / (total registered users). Round to 2 decimal places.

Tables: emails, texts
*/

WITH signup_info AS
(
    SELECT
        e.email_id,
        e.user_id,
        t.signup_action
    FROM
        emails AS e
        LEFT JOIN texts AS t
        ON e.email_id = t.email_id
)

SELECT
    ROUND(
        (SELECT COUNT(DISTINCT email_id) FROM signup_info WHERE signup_action = 'Confirmed')::NUMERIC/
        COUNT(DISTINCT email_id)::NUMERIC, 2
    ) AS confirm_rate
FROM
    signup_info;

/*
Explanation:
1. Left joins emails e to texts t on e.email_id = t.email_id AND t.signup_action = 'Confirmed'.
2. Computes ROUND(COUNT(DISTINCT t.email_id)::DECIMAL / COUNT(DISTINCT e.email_id), 2) AS confirm_rate.
*/