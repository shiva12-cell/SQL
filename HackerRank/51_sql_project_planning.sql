/*
Question: SQL Project Planning
URL: https://www.hackerrank.com/challenges/sql-projects/problem

Description:
Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order, then by start date.
If the End_Date of the task is contiguous with the Start_Date of the next task, they belong to the same project.

Table: Projects
Columns: Task_ID, Start_Date, End_Date
*/

SELECT s.Proj_Start_Date, min(e.Proj_End_Date) as Real_Proj_End_Date 
FROM
(SELECT Start_Date as Proj_Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) s,
(SELECT End_Date as Proj_End_Date FROM Projects WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)) e
WHERE s.Proj_Start_Date < e.Proj_End_Date
GROUP BY s.Proj_Start_Date
ORDER BY DATEDIFF(min(e.Proj_End_Date), s.Proj_Start_Date) ASC, s.Proj_Start_Date ASC;

/*
Explanation:
1. Identifies project start dates: dates in Start_Date that do not appear in End_Date.
2. Identifies project end dates: dates in End_Date that do not appear in Start_Date.
3. Matches each start date with the earliest end date that occurs after it (min(End_Date)).
4. Orders by project duration (DATEDIFF(End_Date, Start_Date) ASC), then by Start_Date ASC.
*/