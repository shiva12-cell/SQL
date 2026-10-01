/*
Question: New Companies
URL: https://www.hackerrank.com/challenges/the-company/problem

Description:
Amber's conglomerate corporation just acquired some new companies.
Write a query to print the company_code, founder name, total number of lead managers, senior managers, managers, and employees. Order by company_code ascending.

Tables: Company, Lead_Manager, Senior_Manager, Manager, Employee
*/

SELECT c.company_code,c.founder,
count(distinct lm.lead_manager_code),
count(distinct sm.senior_manager_code),
count(distinct m.manager_code), 
count(distinct e.employee_code)
FROM Company c, Lead_Manager lm, Senior_Manager sm, Manager m, Employee e
WHERE
c.company_code=lm.company_code AND
lm.lead_manager_code=sm.lead_manager_code AND
sm.senior_manager_code=m.senior_manager_code AND
m.manager_code=e.manager_code
GROUP BY c.company_code,c.founder
ORDER BY c.company_code ASC

/*
Explanation:
1. Joins the Company table to the hierarchical tables or directly counts distinct IDs from the child tables.
2. COUNT(DISTINCT c.lead_manager_code), COUNT(DISTINCT c.senior_manager_code), COUNT(DISTINCT c.manager_code), and COUNT(DISTINCT c.employee_code).
3. Groups by c.company_code, c.founder.
4. Sorts by c.company_code ASC (proper alphanumeric order).
*/