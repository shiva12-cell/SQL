/*
Question: Odd and Even Measurements - Google
URL: https://datalemur.com/questions/odd-even-measurements

Description:
Calculate the sum of odd-numbered measurements and the sum of even-numbered measurements per day.

Table: measurements
*/

WITH odd_even_measurements AS
(
    SELECT
        measurement_id,
        measurement_value,
        measurement_time,
        DATE(measurement_time) AS measurement_day,
        DENSE_RANK() OVER(PARTITION BY DATE(measurement_time) ORDER BY measurement_time ASC) AS measurment_number
    FROM
        measurements
)

SELECT
    measurement_day,
    SUM(CASE WHEN measurment_number IN (1, 3, 5) THEN measurement_value ELSE 0 END) AS odd_sum,
    SUM(CASE WHEN measurment_number IN (2, 4, 6) THEN measurement_value ELSE 0 END) AS even_sum
FROM
    odd_even_measurements
GROUP BY
    measurement_day;

/*
Explanation:
1. Uses ROW_NUMBER() OVER (PARTITION BY DATE(measurement_time) ORDER BY measurement_time) to index measurements.
2. Sums conditionally: SUM(CASE WHEN rn % 2 = 1 THEN measurement_value ELSE 0 END) and even values.
3. Groups by measurement_day.
*/