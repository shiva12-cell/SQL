/*
Question: Revising the Select Query II
URL: https://www.hackerrank.com/challenges/revising-the-select-query-2/problem

Description:
Query the NAME field for all American cities in the CITY table with populations larger than 120,000.
The CountryCode for America is 'USA'.

Table: CITY
Columns: ID, NAME, COUNTRYCODE, DISTRICT, POPULATION
*/

Select name from city where population > 120000 and Countrycode = "USA";

/*
Explanation:
1. Projects only the NAME column using SELECT NAME.
2. Filters the CITY records where CountryCode = 'USA' and POPULATION > 120000.
3. Returns the list of city names that satisfy both requirements.
*/