/*
Question: Placements
URL: https://www.hackerrank.com/challenges/placements/problem

Description:
Write a query to output the names of those students whose best friends got offered a higher salary than them.
Names must be ordered by the salary amount offered to the best friends.
It is guaranteed that no two students got offered the same salary.

Tables: Students, Friends, Packages
*/

Select S.Name
from Students S inner join Friends f
on S.ID = f.ID
inner join Packages p
on f.ID = p.ID
inner join Packages fp
on f.Friend_ID = fp.ID
where fp.Salary > p.Salary
order by fp.Salary;

/*
Explanation:
1. Joins Students s to Friends f on s.ID = f.ID.
2. Joins Packages p1 to obtain the student's own salary (p1.ID = s.ID).
3. Joins Packages p2 to obtain the friend's salary (p2.ID = f.Friend_ID).
4. Filters where friend's salary exceeds student's salary: WHERE p2.Salary > p1.Salary.
5. Orders by p2.Salary ASC.
*/