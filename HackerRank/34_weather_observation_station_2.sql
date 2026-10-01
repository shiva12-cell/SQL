/*
Question: Weather Observation Station 2
URL: https://www.hackerrank.com/challenges/weather-observation-station-2/problem

Description:
Query the sum of Northern Latitudes (LAT_N) and the sum of Western Longitudes (LONG_W) from STATION, rounded to 2 decimal places.

Table: STATION
*/

SELECT ROUND(SUM(LAT_N),2),ROUND(SUM(LONG_W),2)
FROM STATION;

/*
Explanation:
1. Sums the coordinates: SUM(LAT_N) and SUM(LONG_W).
2. Formats to 2 decimal places using ROUND(SUM(LAT_N), 2) and ROUND(SUM(LONG_W), 2).
*/