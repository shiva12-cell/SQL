/*
Question: Weather Observation Station 1
URL: https://www.hackerrank.com/challenges/weather-observation-station-1/problem

Description:
Query a list of CITY and STATE from the STATION table.

Table: STATION
Columns: ID (NUMBER), CITY (VARCHAR2(21)), STATE (VARCHAR2(2)), LAT_N (NUMBER), LONG_W (NUMBER)
*/

select city,State from station;

/*
Explanation:
1. Selects the two specified columns CITY and STATE from the STATION table.
2. Returns all geographic station records without deduplication or row filtering.
*/