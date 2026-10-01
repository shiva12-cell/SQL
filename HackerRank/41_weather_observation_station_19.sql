/*
Question: Weather Observation Station 19
URL: https://www.hackerrank.com/challenges/weather-observation-station-19/problem

Description:
Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where:
- a = min(LAT_N)
- b = min(LONG_W)
- c = max(LAT_N)
- d = max(LONG_W)
Query the Euclidean Distance between points P1 and P2, rounded to 4 decimal places.
Euclidean Distance = sqrt((c - a)^2 + (d - b)^2)

Table: STATION
*/

SELECT ROUND(SQRT(POWER(MAX(LAT_N)-MIN(LAT_N),2)+POWER(MAX(LONG_W)-MIN(LONG_W),2)),4)
FROM STATION;

/*
Explanation:
1. Uses SQL functions POW() and SQRT():
   SQRT(POW(MAX(LAT_N) - MIN(LAT_N), 2) + POW(MAX(LONG_W) - MIN(LONG_W), 2))`n2. Rounds the Euclidean distance to 4 decimal places using ROUND(..., 4).
*/