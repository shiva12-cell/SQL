/*
Question: Weather Observation Station 5
URL: https://www.hackerrank.com/challenges/weather-observation-station-5/problem

Description:
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name).
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

Table: STATION
*/

select city,length(city) from station order By length(city) asc, city asc limit 1;
select distinct(City),length(city) from station order by length(city) desc, city asc limit 1;

/*
Explanation:
1. Shortest city: Orders by LENGTH(CITY) ASC, CITY ASC and limits the output to 1 row (LIMIT 1).
2. Longest city: Orders by LENGTH(CITY) DESC, CITY ASC and limits the output to 1 row (LIMIT 1).
3. Alphabetical tie-breaking handles cases where multiple cities share the minimum or maximum length.
*/