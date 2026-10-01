/*
Question: Population Density Difference
URL: https://www.hackerrank.com/challenges/population-density-difference/problem

Description:
Query the difference between the maximum and minimum populations in CITY.

Table: CITY
*/

SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY

/*
Explanation:
1. Computes the highest population using MAX(POPULATION).
2. Computes the lowest population using MIN(POPULATION).
3. Subtracts min from max: MAX(POPULATION) - MIN(POPULATION).
*/