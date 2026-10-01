/*
Question: Employee Salaries
URL: https://www.hackerrank.com/challenges/salary-of-employees/problem

Description:
Write a query that prints a list of employee names for employees in Employee having a salary greater than  per month who have been employees for less than 10 months. Sort your result by ascending employee_id.

Table: Employee
*/

select name from employee where salary > 2000 and months <10 order By employee_id;

/*
Explanation:
1. Filters records using WHERE salary > 2000 AND months < 10.
2. Sorts the output deterministically using ORDER BY employee_id ASC.
*/