/*
Question: Revising the Select Query I
URL: https://www.hackerrank.com/challenges/revising-the-select-query/problem

Description:
Query all columns for all American cities in the CITY table with populations larger than 100,000.
The CountryCode for America is 'USA'.

Table: CITY
Columns: ID (NUMBER), NAME (VARCHAR2(17)), COUNTRYCODE (VARCHAR2(3)), DISTRICT (VARCHAR2(20)), POPULATION (NUMBER)
*/

SELECT * FROM CITY WHERE population > 100000 AND Countrycode ="USA";

/*
Explanation:
1. Filters the CITY table using the WHERE clause with two conditions combined by AND:
   - POPULATION > 100000 ensures only cities with a population strictly exceeding 100,000 are selected.
   - CountryCode = 'USA' filters specifically for cities located in the United States.
2. Uses SELECT * to return all attributes/columns for the qualifying records.
*/