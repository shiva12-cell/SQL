/*
Question: Japan Population
URL: https://www.hackerrank.com/challenges/japan-population/problem

Description:
Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is 'JPN'.

Table: CITY
*/

SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE ='JPN'

/*
Explanation:
1. Filters for Japanese cities using WHERE COUNTRYCODE = 'JPN'.
2. Computes the sum using SUM(POPULATION).
*/