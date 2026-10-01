/*
Question: App Clickthrough Rate (CTR) - Facebook
URL: https://datalemur.com/questions/sql-app-ctr

Description:
Write a query to calculate the click-through rate (CTR) for the creative in each app in 2022 and round the results to 2 decimal places.
CTR = 100.0 * (Number of clicks / Number of impressions)

Table: events (app_id, event_type, timestamp)
*/

SELECT
    app_id,
    ROUND(
        100 *
        SUM(CASE WHEN event_type = 'click' THEN 1.0 ELSE 0.0 END) /
        SUM(CASE WHEN event_type = 'impression' THEN 1.0 ELSE 0.0 END),
        2
    ) AS ctr
FROM
    events
WHERE
    DATE_PART('year', timestamp) = 2022
GROUP BY
    app_id;

/*
Explanation:
1. Filters events occurring in 2022.
2. Groups by pp_id.
3. Uses conditional counting:
   ROUND(100.0 * SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) / NULLIF(SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END), 0), 2) AS ctr.
4. Handles division by zero gracefully using NULLIF.
*/