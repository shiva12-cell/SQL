/*
Question: Challenges
URL: https://www.hackerrank.com/challenges/challenges/problem

Description:
Julia asked her students to create coding challenges.
Write a query to print the hacker_id, name, and total number of challenges created by each student.
Sort by total challenges descending, then hacker_id ascending.
If more than one student created the same number of challenges, and that number is less than the maximum number of challenges created, exclude those students from the result.

Tables: Hackers, Challenges
*/

select H.hacker_id, H.name, count(C.challenge_id) as total_count
from Hackers H join Challenges C
on H.hacker_id = C.hacker_id
group by H.hacker_id, H.name
having total_count = 
(
select count(temp1.challenge_id) as max_count
    from challenges temp1
    group by temp1.hacker_id
    order by max_count desc
    limit 1
)
or total_count in
(
    select distinct other_counts from (
select H2.hacker_id, H2.name, count(C2.challenge_id) as other_counts
from Hackers H2 join Challenges C2
on H2.hacker_id = C2.hacker_id
group by H2.hacker_id, H2.name
) temp2
    group by other_counts
having count(other_counts) =1)
order by total_count desc, H.hacker_id

/*
Explanation:
1. Counts challenges per hacker: COUNT(c.challenge_id).
2. Determines the overall maximum challenge count.
3. Retains hackers whose challenge count is equal to the maximum, OR whose challenge count is unique across all hackers (using HAVING with count subqueries).
4. Orders by total_challenges DESC, hacker_id ASC.
*/