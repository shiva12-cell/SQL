/*
Question: Weather Observation Station 4
URL: https://www.hackerrank.com/challenges/weather-observation-station-4/problem

Description:
Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the STATION table.

Table: STATION
Columns: ID, CITY, STATE, LAT_N, LONG_W
*/

select count(city) - count(distinct city) from station;

/*
Explanation:
1. COUNT(CITY) computes the total number of records with a city name.
2. COUNT(DISTINCT CITY) computes the count of unique city names.
3. Subtracting the two gives the count of duplicate occurrences.
*/