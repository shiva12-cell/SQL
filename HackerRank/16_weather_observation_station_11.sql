/*
Question: Weather Observation Station 11
URL: https://www.hackerrank.com/challenges/weather-observation-station-11/problem

Description:
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

Table: STATION
*/

select distinct city from station where left(city,1) not in('a','e','i','o','u') or right(city,1) not in('a','e','i','o','u');

/*
Explanation:
1. Applies De Morgan's laws: either start is non-vowel OR end is non-vowel (NOT (start AND end)).
2. Implemented as CITY NOT REGEXP '^[aeiou].*[aeiou]$' or (LEFT(...) NOT IN (...) OR RIGHT(...) NOT IN (...)).
3. Uses DISTINCT CITY.
*/