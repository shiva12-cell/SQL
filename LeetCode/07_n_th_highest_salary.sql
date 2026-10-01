/*
Question: N-th Highest Salary
URL: https://leetcode.com/problems/nth-highest-salary/

Description:
Write a SQL function to get the nth highest salary from the Employee table. If there is no nth highest salary, return null.

Table: Employee (id, salary)
*/

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      SELECT 
        Salary
      FROM (
      SELECT 
        Salary,
        DENSE_RANK() OVER(ORDER BY Salary DESC) AS rnk
      FROM Employee
      ) base
      WHERE rnk = N
      GROUP BY 1
  );
END

/*
Explanation:
1. Declares an offset variable: SET M = N - 1;.
2. Queries distinct salaries: SELECT DISTINCT salary FROM Employee ORDER BY salary DESC LIMIT 1 OFFSET M.
3. If fewer than N distinct salaries exist, MySQL scalar subquery evaluation naturally returns NULL.
*/