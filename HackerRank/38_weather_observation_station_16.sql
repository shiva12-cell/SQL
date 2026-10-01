/*
Question: Weather Observation Station 16
URL: https://www.hackerrank.com/challenges/weather-observation-station-16/problem

Description:
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780, rounded to 4 decimal places.

Table: STATION
*/

select Round(min(LAT_N),4) 
from STATION
where LAT_N > 38.7780;

/*
Explanation:
1. Filters rows with WHERE LAT_N > 38.7780.
2. Finds the minimum using MIN(LAT_N) and rounds to 4 decimals with ROUND(..., 4).
*/