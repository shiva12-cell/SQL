/*
Question: Weather Observation Station 17
URL: https://www.hackerrank.com/challenges/weather-observation-station-17/problem

Description:
Query the Western Longitude (LONG_W) for the smallest Northern Latitude (LAT_N) in STATION that is greater than 38.7780, rounded to 4 decimal places.

Table: STATION
*/

select Round(LONG_W,4)
from STATION
where LAT_N = (
select MIN(LAT_N) 
from STATION
where LAT_N > 38.7780);

/*
Explanation:
1. Filters rows where LAT_N > 38.7780.
2. Orders by LAT_N ASC to get the smallest Northern Latitude on top.
3. Selects ROUND(LONG_W, 4) and limits output to 1 row (LIMIT 1).
*/