/*
Question: Department Top Three Salaries
URL: https://leetcode.com/problems/department-top-three-salaries/submissions/

Description:
A company's executives are interested in seeing who earns the most money in each of the company's departments.
A high earner in a department is an employee who has a salary in the top three unique salaries for that department.
Write a solution to find the employees who are high earners in each of the departments.

Tables: Employee (id, name, salary, departmentId), Department (id, name)
*/

SELECT 
    Department,
    Employee,
    Salary
FROM (
    SELECT
        L.Name As Employee,
        L.Salary,
        R.Name AS Department,
        DENSE_RANK() OVER (
           PARTITION BY L.DepartmentId
           ORDER BY L.Salary DESC) rnk
    FROM 
        Employee AS L
    JOIN
        Department AS R
    ON 
        L.DepartmentId = R.Id
) base
WHERE 
        base.rnk <= 3
;

/*
Explanation:
1. Uses window function DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) to rank distinct salaries within each department.
2. Filters the ranked CTE or subquery where ank <= 3.
3. Joins with Department on departmentId = Department.id to get department names.
4. Projects Department, Employee, and Salary.
*/