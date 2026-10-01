/*
Question: Weather Observation Station 3
URL: https://www.hackerrank.com/challenges/weather-observation-station-3/problem

Description:
Query a list of CITY names from STATION for cities that have an even ID number. Exclude duplicates from your answer.

Table: STATION
Columns: ID, CITY, STATE, LAT_N, LONG_W
*/

Select distinct city from station where ID%2=0;

/*
Explanation:
1. Evaluates parity using the modulo operator ID % 2 = 0 (or MOD(ID, 2) = 0) to identify even IDs.
2. Applies DISTINCT on CITY to deduplicate city names that may share or repeat values.
*/