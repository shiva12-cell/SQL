/*
Question: Weather Observation Station 6
URL: https://www.hackerrank.com/challenges/weather-observation-station-6/problem

Description:
Query the list of CITY names starting with vowels (i.e., 'a', 'e', 'i', 'o', or 'u') from STATION. Your result cannot contain duplicates.

Table: STATION
*/

select distinct(city) from station where
city like "a%" or
city like "e%" or
city like "i%" or
city like "o%" or
city like "u%";

# this works faster and better
select distinct city from station where left(city,1) in('a','e','i','o','u')

/*
Explanation:
1. Uses pattern matching via regex (e.g., WHERE CITY REGEXP '^[aeiou]' in MySQL or LEFT(CITY, 1) IN ('a','e','i','o','u')).
2. Uses SELECT DISTINCT CITY to guarantee no duplicate city names appear in the output.
*/