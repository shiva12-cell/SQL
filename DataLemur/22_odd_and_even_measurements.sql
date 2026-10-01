/*
Question: Odd and Even Measurements - Google
URL: https://datalemur.com/questions/odd-even-measurements

Description:
Assume you're given a table with measurement values from sensors recorded throughout the day.
Within each day, order measurements by timestamp and assign them an ordinal rank.
Write a query to calculate the sum of odd-numbered measurements and the sum of even-numbered measurements per day.

Table: measurements (measurement_id, measurement_value, measurement_time)
*/

SELECT 
  measurement_day,
  SUM(CASE WHEN day_rnk % 2 != 0 THEN measurement_value ELSE 0 END) odd_sum,
  SUM(CASE WHEN day_rnk % 2 = 0 THEN measurement_value ELSE 0 END) even_sum
FROM (
  SELECT
    measurement_time::DATE AS measurement_day,
    measurement_value,
    ROW_NUMBER() OVER(
                    PARTITION BY measurement_time::DATE
                    ORDER BY measurement_time ASC
    ) AS day_rnk
  FROM 
    measurements
) BASE
GROUP BY 1
;

/*
Explanation:
1. Assigns row numbers partitioned by date: ROW_NUMBER() OVER (PARTITION BY DATE(measurement_time) ORDER BY measurement_time ASC) as n.
2. In outer query, groups by DATE(measurement_time) AS measurement_day.
3. Sums conditionally: SUM(CASE WHEN rn % 2 = 1 THEN measurement_value ELSE 0 END) AS odd_sum, and even sum similarly.
4. Orders by measurement_day ASC.
*/