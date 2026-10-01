/*
Question: The Report
URL: https://www.hackerrank.com/challenges/the-report/submissions/code/94188063

Description:
Generate a report containing three columns: Name, Grade and Mark.
- Ketty doesn't want the names of those students who received a grade lower than 8 (grades 1-7 should display as NULL).
- Order by Grade descending.
- If multiple students have the same grade (8-10), order them alphabetically by Name.
- If grade is 1-7, order by Mark ascending.

Tables: Students (ID, Name, Marks), Grades (Grade, Min_Mark, Max_Mark)
*/

SELECT CASE
         WHEN G.grade > 7 THEN S.name
         ELSE NULL
       end AS names,
       G.grade,
       S.marks
FROM   students S
       JOIN grades G
         ON S.marks BETWEEN G.min_mark AND G.max_mark
ORDER  BY G.grade DESC,
          names ASC,
          S.marks ASC;

/*
Explanation:
1. Joins Students and Grades using non-equi join: ON Students.Marks BETWEEN Grades.Min_Mark AND Grades.Max_Mark.
2. Uses CASE WHEN Grades.Grade >= 8 THEN Students.Name ELSE NULL END for the name column.
3. Orders by Grades.Grade DESC, Students.Name ASC, Students.Marks ASC.
*/