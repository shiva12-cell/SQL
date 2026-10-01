/*
Question: Laptop vs Mobile Viewership - New York Times
URL: https://datalemur.com/questions/laptop-mobile-viewership

Description:
Write a query that calculates the total viewership for laptops and mobile devices, where mobile is defined as the sum of tablet and phone viewership.
Output the total viewership for laptops as laptop_views and the total viewership for mobile devices as mobile_views.

Table: viewership (user_id, device_type, view_time)
*/

SELECT
    SUM(
        CASE
            WHEN device_type = 'laptop' THEN 1 ELSE 0
        END
    ) AS laptop_views,
    SUM(
        CASE
        WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0
        END
    ) AS mobile_views
FROM
    viewership;

/*
Explanation:
1. Uses conditional aggregation (COUNT(CASE ...) or SUM(CASE ...)):
   - COUNT(CASE WHEN device_type = 'laptop' THEN 1 END) AS laptop_views`n   - COUNT(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 END) AS mobile_views`n2. Returns both totals in a single row.
*/