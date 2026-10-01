/*
Question: Employee Names
URL: https://www.hackerrank.com/challenges/name-of-employees/problem

Description:
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

Table: Employee
Columns: employee_id, name, months, salary
*/

select name from employee order by name;

/*
Explanation:
1. Selects the 
ame column from the Employee table.
2. Sorts alphabetically in ascending order using ORDER BY name ASC.
*/