/*
Question: Richer Than UK
URL: https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

Description:
List the countries in Europe with a per capita GDP greater than 'United Kingdom'.
Per capita GDP is gdp/population.

Table: world (name, continent, area, population, gdp)
*/

SELECT name 
FROM world
WHERE continent LIKE 'Europe'
AND gdp / population > 
(SELECT gdp / population 
 FROM world
 WHERE name LIKE 'United Kingdom')

/*
Explanation:
1. Subquery computes the GDP per capita of the United Kingdom:
   (SELECT gdp/population FROM world WHERE name = 'United Kingdom').
2. Outer query filters European countries whose per capita GDP exceeds this threshold:
   WHERE continent = 'Europe' AND gdp/population > (subquery).
*/