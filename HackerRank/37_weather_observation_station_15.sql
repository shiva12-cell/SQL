/*
Question: Weather Observation Station 15
URL: https://www.hackerrank.com/challenges/weather-observation-station-15/problem

Description:
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345, rounded to 4 decimal places.

Table: STATION
*/

select Round(LONG_W,4)
 from  STATION
 where LAT_N = (Select Max(LAT_N)from STATION where LAT_N < 137.2345);

/*
Explanation:
1. Filters rows where LAT_N < 137.2345.
2. Orders by LAT_N DESC to place the largest qualifying latitude first.
3. Selects ROUND(LONG_W, 4) and takes the top row with LIMIT 1.
*/