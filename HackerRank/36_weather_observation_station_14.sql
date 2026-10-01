/*
Question: Weather Observation Station 14
URL: https://www.hackerrank.com/challenges/weather-observation-station-14/problem

Description:
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345, truncated to 4 decimal places.

Table: STATION
*/

select Round(max(LAT_N),4)
from STATION
where LAT_N < 137.2345;

/*
Explanation:
1. Filters rows with WHERE LAT_N < 137.2345.
2. Finds the maximum latitude using MAX(LAT_N).
3. Truncates/rounds to 4 decimal places using TRUNCATE(MAX(LAT_N), 4).
*/