/*
Question: Higher Than 75 Marks
URL: https://www.hackerrank.com/challenges/more-than-75-marks/problem

Description:
Query the Name of any student in STUDENTS who scored higher than 75 Marks.
Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters, secondary sort them by ascending ID.

Table: STUDENTS
Columns: ID (INTEGER), NAME (STRING), MARKS (INTEGER)
*/

select name from students where marks > 75 order by right(name,3),id asc;

/*
Explanation:
1. Filters students with WHERE MARKS > 75.
2. Uses RIGHT(NAME, 3) (or SUBSTRING(NAME, -3)) in the ORDER BY clause to sort by the trailing substring.
3. Uses ID ASC as the secondary sorting tie-breaker.
*/