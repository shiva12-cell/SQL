/*
Question: Bad Delivery Rate - DoorDash
URL: https://datalemur.com/questions/sql-bad-experience

Description:
Calculate the bad experience delivery rate for DoorDash orders.
A bad experience is an order that was canceled by the customer or restaurant, or delivered more than 20 minutes late.
Round the bad delivery rate percentage to 2 decimal places.

Tables: orders, trips
*/

WITH order_details AS
(
    SELECT
        o.order_id,
        o.status,
        o.order_timestamp,
        c.signup_timestamp
    FROM
        orders AS o
        INNER JOIN customers AS c
        ON o.customer_id = c.customer_id
    WHERE
        DATE_PART('year', signup_timestamp) = 2022 AND
        DATE_PART('month', signup_timestamp) = 6
)

SELECT
    ROUND(
        100 *
        SUM(CASE WHEN status = 'completed successfully' THEN 0 ELSE 1 END)::NUMERIC /
        COUNT(DISTINCT order_id),
        2
    ) AS bad_experience_pct
FROM
    order_details
WHERE
    DATE(order_timestamp) <= DATE(signup_timestamp) + '14 days'::INTERVAL;

/*
Explanation:
1. Joins orders to trips on order_id.
2. Flags bad experience: status = 'canceled' OR actual_delivery_time > estimated_delivery_time + INTERVAL '20 minutes'.
3. Computes ROUND(100.0 * SUM(CASE WHEN is_bad THEN 1 ELSE 0 END) / COUNT(*), 2) AS bad_rate.
*/