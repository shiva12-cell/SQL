/*
Question: African Cities
URL: https://www.hackerrank.com/challenges/african-cities/problem

Description:
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Tables: CITY, COUNTRY
*/

select city.name from city join country on city.countrycode = country.code where country.continent = 'Africa';

/*
Explanation:
1. Joins CITY with COUNTRY on CITY.CountryCode = COUNTRY.Code.
2. Filters for COUNTRY.Continent = 'Africa'.
3. Projects the city names: SELECT CITY.NAME.
*/