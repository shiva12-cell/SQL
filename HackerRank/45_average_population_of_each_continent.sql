/*
Question: Average Population of Each Continent
URL: https://www.hackerrank.com/challenges/average-population-of-each-continent/problem

Description:
Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

Tables: CITY, COUNTRY
*/

select country.continent, floor(avg(city.population)) from country join city on city.countrycode = country.code group by country.continent;

/*
Explanation:
1. Joins CITY with COUNTRY on CITY.CountryCode = COUNTRY.Code.
2. Groups by COUNTRY.Continent.
3. Calculates average city population per continent and rounds down with FLOOR(AVG(CITY.Population)).
*/