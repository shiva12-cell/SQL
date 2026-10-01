/*
Question: Revising Aggregations - The Sum Function
URL: https://www.hackerrank.com/challenges/revising-aggregations-sum/problem

Description:
Query the total population of all cities in CITY where District is 'California'.

Table: CITY
*/

SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California'

/*
Explanation:
1. Filters rows with WHERE DISTRICT = 'California'.
2. Uses aggregate function SUM(POPULATION) to compute the cumulative population.
*/