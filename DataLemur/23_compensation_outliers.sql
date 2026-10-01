/*
Question: Compensation Outliers - Accenture
URL: https://datalemur.com/questions/compensation-outliers

Description:
Find employees whose compensation is an outlier within their job title.
An outlier is defined as earning more than twice (> 2x) or less than half (< 0.5x) the average salary of peers with the same title.

Table: employee_pay (employee_id, salary, title)
*/

WITH employee_status AS
(
    SELECT 
        e1.employee_id,
        e1.salary,
        e1.title,
        CASE
            WHEN salary > 2 * (SELECT AVG(e2.salary) FROM employee_pay AS e2 WHERE e1.title = e2.title) THEN 'Overpaid'
            WHEN salary < 0.5 * (SELECT AVG(e2.salary) FROM employee_pay AS e2 WHERE e1.title = e2.title) THEN 'Underpaid'
            ELSE 'Near Average'
        END AS status
    FROM 
        employee_pay AS e1
)

SELECT
    employee_id,
    salary,
    status
FROM
    employee_status
WHERE
    status IN ('Underpaid', 'Overpaid');

/*
Explanation:
1. Computes mean salary per title using window function: AVG(salary) OVER (PARTITION BY title) AS avg_salary.
2. Evaluates outlier conditions: salary > 2 * avg_salary OR salary < 0.5 * avg_salary.
3. Selects employee_id, salary, title, and outlier status.
*/