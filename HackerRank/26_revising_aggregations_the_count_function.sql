/*
Question: Revising Aggregations - The Count Function
URL: https://www.hackerrank.com/challenges/revising-aggregations-the-count-function/problem

Description:
Query a count of the number of cities in CITY having a Population larger than 100,000.

Table: CITY
*/

SELECT COUNT(*) FROM CITY WHERE POPULATION > 100000

/*
Explanation:
1. Filters city records with WHERE POPULATION > 100000.
2. Uses aggregate function COUNT(*) to calculate the number of qualifying rows.
*/