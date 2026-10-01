/*
Question: Revising Aggregations - Averages
URL: https://www.hackerrank.com/challenges/revising-aggregations-the-average-function/problem

Description:
Query the average population of all cities in CITY where District is 'California'.

Table: CITY
*/

SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT ='California'

/*
Explanation:
1. Filters rows with WHERE DISTRICT = 'California'.
2. Uses aggregate function AVG(POPULATION) to calculate the arithmetic mean.
*/