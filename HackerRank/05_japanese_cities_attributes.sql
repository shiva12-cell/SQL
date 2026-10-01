/*
Question: Japanese Cities' Attributes
URL: https://www.hackerrank.com/challenges/japanese-cities-attributes/problem

Description:
Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is 'JPN'.

Table: CITY
Columns: ID, NAME, COUNTRYCODE, DISTRICT, POPULATION
*/

select * from city where countrycode="JPN";

/*
Explanation:
1. Filters rows with WHERE CountryCode = 'JPN'.
2. Returns all columns (SELECT *) for all qualifying Japanese cities.
*/