/*
Question: Weather Observation Station 7
URL: https://www.hackerrank.com/challenges/weather-observation-station-7/problem

Description:
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

Table: STATION
*/

select distinct city from station where right(city,1) in('a','e','i','o','u')

/*
Explanation:
1. Uses pattern matching (e.g., WHERE CITY REGEXP '[aeiou]$' or RIGHT(CITY, 1) IN ('a','e','i','o','u')).
2. Applies DISTINCT on CITY to eliminate duplicate entries.
*/