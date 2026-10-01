/*
Question: Bigger Than Every Country In Europe
URL: https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

Description:
Find the countries with a population greater than every country in Europe. Give the name only.
(Some countries may have NULL gdp values).

Table: world
*/

SELECT name 
FROM world
WHERE gdp > 
	  (SELECT 
	   MAX(gdp) 
	   FROM world 
	   WHERE continent LIKE 'Europe')

/*
Explanation:
1. Subquery retrieves maximum European population: (SELECT MAX(population) FROM world WHERE continent = 'Europe') or uses > ALL (SELECT population FROM world WHERE continent = 'Europe' AND population > 0).
2. Outer query filters population > (subquery) and returns country name.
*/