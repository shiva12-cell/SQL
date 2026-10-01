/*
Question: Weather Observation Station 10
URL: https://www.hackerrank.com/challenges/weather-observation-station-10/problem

Description:
Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.

Table: STATION
*/

select distinct(city) from station where
city not like "%a" and
city not like "%e" and
city not like "%i" and
city not like "%o" and
city not like "%u";

/*
Explanation:
1. Inverts the vowel suffix condition using WHERE CITY NOT REGEXP '[aeiou]$' (or RIGHT(CITY, 1) NOT IN ('a','e','i','o','u')).
2. Employs DISTINCT to avoid repeating names.
*/