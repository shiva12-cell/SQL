/*
Question: Japanese Cities' Names
URL: https://www.hackerrank.com/challenges/japanese-cities-name/problem

Description:
Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is 'JPN'.

Table: CITY
Columns: ID, NAME, COUNTRYCODE, DISTRICT, POPULATION
*/

select name from city where CountryCode="JPN";

/*
Explanation:
1. Restricts the returned projection to NAME (SELECT NAME).
2. Filters the dataset to Japanese cities using WHERE CountryCode = 'JPN'.
*/