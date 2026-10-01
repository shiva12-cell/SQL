/*
Question: Neighbours of Argentina and Australia
URL: https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

Description:
List the name and continent of countries in the continents containing 'Argentina' or 'Australia'. Order by name of the country.

Table: world
*/

SELECT name, continent 
FROM world
WHERE continent LIKE
(SELECT continent FROM world WHERE name LIKE 'Argentina')
OR
continent LIKE
(SELECT continent FROM world WHERE name LIKE 'Australia')
ORDER BY name

/*
Explanation:
1. Subquery identifies continents containing Argentina or Australia:
   SELECT continent FROM world WHERE name IN ('Argentina', 'Australia').
2. Outer query selects 
ame, continent where continent IN (subquery).
3. Orders output alphabetically by 
ame.
*/