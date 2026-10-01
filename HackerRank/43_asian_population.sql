/*
Question: Asian Population
URL: https://www.hackerrank.com/challenges/asian-population/problem

Description:
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Tables: CITY, COUNTRY
Keys: CITY.CountryCode = COUNTRY.Code
*/

select sum(city.population) from country left join city on country.code = city.countrycode where country.continent = 'Asia'

/*
Explanation:
1. Joins CITY with COUNTRY on CITY.CountryCode = COUNTRY.Code.
2. Filters where COUNTRY.Continent = 'Asia'.
3. Calculates total population with SUM(CITY.POPULATION).
*/