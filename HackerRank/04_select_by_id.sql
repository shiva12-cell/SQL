/*
Question: Select By ID
URL: https://www.hackerrank.com/challenges/select-by-id/problem

Description:
Query all columns for a city in the CITY table with the ID 1661.

Table: CITY
Columns: ID, NAME, COUNTRYCODE, DISTRICT, POPULATION
*/

select * from city where ID=1661;

/*
Explanation:
1. Uses a primary key lookup filter WHERE ID = 1661.
2. Selects all attributes with SELECT * for this unique record.
*/