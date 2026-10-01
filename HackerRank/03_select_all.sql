/*
Question: Select All
URL: https://www.hackerrank.com/challenges/select-all-sql/problem

Description:
Query all columns (attributes) for every row in the CITY table.

Table: CITY
Columns: ID, NAME, COUNTRYCODE, DISTRICT, POPULATION
*/

Select * from city

/*
Explanation:
1. Performs an unconditional table scan with SELECT * FROM CITY.
2. Retrieves every attribute for every city record without filtering.
*/