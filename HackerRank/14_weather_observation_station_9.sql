/*
Question: Weather Observation Station 9
URL: https://www.hackerrank.com/challenges/weather-observation-station-9/problem

Description:
Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

Table: STATION
*/

select distinct city from station where left(city,1) not in('a','e','i','o','u')

/*
Explanation:
1. Inverts the vowel prefix condition using WHERE CITY NOT REGEXP '^[aeiou]' (or LEFT(CITY, 1) NOT IN ('a','e','i','o','u')).
2. Deduplicates with DISTINCT.
*/