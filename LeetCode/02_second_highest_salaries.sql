/*
Question: Second highest salaries
URL: https://leetcode.com/problems/second-highest-salary/description/

Description:
Find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (NULL).

Table: Employee
Columns: id (INT), salary (INT)
*/

SELECT MAX(Salary) AS SecondHighestSalary
FROM 
Employee E2
WHERE
E2.Salary <
(SELECT MAX(Salary)
FROM 
Employee)

/*
Explanation:
1. Uses subquery approach MAX(salary) filtered with WHERE salary < (SELECT MAX(salary) FROM Employee) or LIMIT 1 OFFSET 1 wrapped in an outer SELECT (...) AS SecondHighestSalary.
2. Wrapping in an outer scalar query ensures that if no second highest salary exists (e.g. only 1 employee or all share the same salary), it safely evaluates to NULL instead of returning an empty set.
*/