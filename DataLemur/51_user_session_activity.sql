/*
Question: User Session Activity - Twitter
URL: https://datalemur.com/questions/sql-session-activity

Description:
Count the number of active user sessions within specific rolling time windows.

Table: user_sessions
*/

WITH tweeter_sessions AS
(
    SELECT
        user_id,
        session_type,
        SUM(duration) AS total_duration
    FROM 
        sessions
    WHERE
        start_date BETWEEN '2022-01-01' AND '2022-02-01'
    GROUP BY
        user_id,
        session_type
)

SELECT
    user_id,
    session_type,
    DENSE_RANK() OVER(PARTITION BY session_type ORDER BY total_duration DESC) AS ranking
FROM
    tweeter_sessions;

/*
Explanation:
1. Filters session events within the evaluation period.
2. Groups by date or session type.
3. Aggregates active session metrics.
*/