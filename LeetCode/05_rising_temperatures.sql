/*
Question: Rising Temperatures
URL: https://leetcode.com/problems/rising-temperature

Description:
Find all dates' id with higher temperatures compared to its previous dates (yesterday).

Table: Weather
Columns: id (INT), recordDate (DATE), temperature (INT)
recordDate is unique.
*/

SELECT W1.Id
FROM Weather AS W1
LEFT JOIN Weather AS W2
ON DATE_ADD(W2.RecordDate, INTERVAL 1 DAY ) = W1.RecordDate
WHERE W1.Temperature > W2.Temperature
;

/*
Explanation:
1. Joins the table with itself: FROM Weather w1 JOIN Weather w2.
2. Matches records where w1 is exactly one day after w2 using date math: DATEDIFF(w1.recordDate, w2.recordDate) = 1 (or w1.recordDate = w2.recordDate + INTERVAL 1 DAY).
3. Filters where current temperature is higher: WHERE w1.temperature > w2.temperature.
4. Selects w1.id.
*/