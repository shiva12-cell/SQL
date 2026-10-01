/*
Question: Weather Observation Station 12
URL: https://www.hackerrank.com/challenges/weather-observation-station-12/problem

Description:
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.

Table: STATION
*/

select distinct city from station where left(city,1) not in('a','e','i','o','u') and right(city,1) not in('a','e','i','o','u');

/*
Explanation:
1. Requires both conditions simultaneously: does not start with a vowel AND does not end with a vowel.
2. Implemented with regex WHERE CITY NOT REGEXP '^[aeiou]' AND CITY NOT REGEXP '[aeiou]$'.
3. Deduplicates using DISTINCT.
*/