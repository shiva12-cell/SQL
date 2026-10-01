/*
Question: Average Population
URL: https://www.hackerrank.com/challenges/average-population/problem

Description:
Query the average population for all cities in CITY, rounded down to the nearest integer.

Table: CITY
*/

SELECT FLOOR(AVG(POPULATION))
FROM CITY

/*
Explanation:
1. Computes mean population with AVG(POPULATION).
2. Rounds down to the nearest integer using FLOOR() (or ROUND(..., 0) depending on engine conventions).
*/