/*
Question: Weather Observation Station 8
URL: https://www.hackerrank.com/challenges/weather-observation-station-8/problem

Description:
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.

Table: STATION
*/

select distinct city from station where left(city,1) in('a','e','i','o','u') and right(city,1) in('a','e','i','o','u')

/*
Explanation:
1. Matches the start and end of the string using regular expressions ^[aeiou].*[aeiou]$ or combining LEFT and RIGHT checks with AND.
2. Case-insensitivity ensures lowercase/uppercase vowels are both matched.
3. Deduplicates results with DISTINCT.
*/