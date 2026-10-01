/*
Question: Department Highest Salary
URL: https://leetcode.com/problems/department-highest-salary/

Description:
Find employees who have the highest salary in each of the departments.

Tables: Employee (id, name, salary, departmentId), Department (id, name)
*/

SELECT 
    D.Name AS Department,
    E.Name As Employee,
    E.Salary
FROM (
    SELECT 
        Name,
        DepartmentId,
        Salary,
        RANK() OVER(PARTITION BY DepartmentId ORDER BY Salary DESC) rnk
    FROM
        Employee 
) AS E
JOIN Department As D
ON 
    E.DepartmentId = D.Id
WHERE 
    E.rnk = 1
;

/*
Explanation:
1. Subquery finds maximum salary per department: (departmentId, MAX(salary)) FROM Employee GROUP BY departmentId.
2. Joins Employee with Department and filters using (departmentId, salary) IN (subquery) or window function RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) = 1.
3. Allows multiple employees in the same department to be returned if they tie for highest salary.
*/