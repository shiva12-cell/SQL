/*
Question: Weather Observation Station 18
URL: https://www.hackerrank.com/challenges/weather-observation-station-18/problem

Description:
Consider P1(a,b) and P2(c,d) to be two points on a 2D plane where:
- a = min(LAT_N)
- b = min(LONG_W)
- c = max(LAT_N)
- d = max(LONG_W)
Query the Manhattan Distance between points P1 and P2, rounded to 4 decimal places.
Manhattan Distance = |a - c| + |b - d|

Table: STATION
*/

select Round(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)),4)
FROM STATION;

/*
Explanation:
1. Manhattan Distance formula: |x1 - x2| + |y1 - y2|.
2. Here: |min(LAT_N) - max(LAT_N)| + |min(LONG_W) - max(LONG_W)| which simplifies to (max(LAT_N) - min(LAT_N)) + (max(LONG_W) - min(LONG_W)).
3. Formatted to 4 decimal places with ROUND(..., 4).
*/