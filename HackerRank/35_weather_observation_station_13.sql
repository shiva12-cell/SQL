/*
Question: Weather Observation Station 13
URL: https://www.hackerrank.com/challenges/weather-observation-station-13/problem

Description:
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345, truncated/rounded to 4 decimal places.

Table: STATION
*/

select Round(sum(LAT_N),4)
from STATION 
where LAT_N > 38.7880 and LAT_N < 137.2345;

/*
Explanation:
1. Filters coordinates: WHERE LAT_N > 38.7880 AND LAT_N < 137.2345.
2. Computes the sum and rounds to 4 decimals using ROUND(SUM(LAT_N), 4) (or TRUNCATE(SUM(LAT_N), 4)).
*/