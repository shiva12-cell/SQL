/*
Question: The Blunder
URL: https://www.hackerrank.com/challenges/the-blunder/problem

Description:
Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but her keyboard's 0 key was broken.
Write a query calculating the amount of error (actual average salary - miscalculated average salary without zeros), rounded up to the next integer.

Table: EMPLOYEES
Columns: ID, NAME, SALARY
*/

SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary,'0','')))
FROM  EMPLOYEES

/*
Explanation:
1. Calculates actual mean: AVG(SALARY).
2. Simulates Samantha's typo by stripping zeros: REPLACE(CAST(SALARY AS CHAR), '0', '').
3. Takes the difference: AVG(SALARY) - AVG(REPLACE(...)).
4. Rounds up to the next integer using CEIL().
*/