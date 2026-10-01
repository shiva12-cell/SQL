/*
Question: Employees earn more than their managers
URL: https://leetcode.com/problems/employees-earning-more-than-their-managers/description/

Description:
Find the employees who earn more than their managers.

Table: Employee
Columns: id (INT), name (VARCHAR), salary (INT), managerId (INT)
id is the primary key column for this table.
Each row indicates the ID of an employee, their name, salary, and the ID of their manager.
*/

SELECT E1.name as Employee
FROM Employee E1 
LEFT JOIN Employee E2
ON (E1.ManagerId = E2.Id)
WHERE E1.Salary > E2.Salary;

/*
Explanation:
1. Self-joins the Employee table (aliased as E1 for employees, E2 for managers) on E1.managerId = E2.id.
2. Filters where employee's salary is strictly greater than manager's salary: WHERE E1.salary > E2.salary.
3. Selects E1.name AS Employee as specified in the output schema.
*/