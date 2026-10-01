/*
Question: Top Earners
URL: https://www.hackerrank.com/challenges/earnings-of-employees/problem

Description:
We define an employee's total earnings to be their monthly salary * months worked.
Find the maximum total earnings for any employee in Employee table as well as the total number of employees having maximum total earnings.

Table: Employee
*/

SELECT MONTHS*SALARY AS earnings, COUNT(*)
FROM employee
GROUP BY earnings 
ORDER BY earnings DESC
LIMIT 1;

/*
Explanation:
1. Projects total earnings: salary * months.
2. Groups by salary * months, orders by earnings descending (ORDER BY 1 DESC), and limits to 1 row (LIMIT 1).
3. The COUNT(*) in the projected row gives the number of employees earning that maximum amount.
*/