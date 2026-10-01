/*
Question: Data Science Skills - LinkedIn
URL: https://datalemur.com/questions/matching-skills

Description:
Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job.
Find candidates who are proficient in Python, Tableau, and PostgreSQL.
Write a query to list the candidates who possess all of the required skills for this job. Sort by candidate_id in ascending order.

Table: candidates (candidate_id, skill)
*/

SELECT
    candidate_id
FROM
    candidates
GROUP BY
    candidate_id
HAVING
    SUM(
        (CASE WHEN skill = 'Python' THEN 1 ELSE 0 END) +
        (CASE WHEN skill = 'Tableau' THEN 1 ELSE 0 END) +
        (CASE WHEN skill = 'PostgreSQL' THEN 1 ELSE 0 END)
    ) = 3
ORDER BY
    candidate_id ASC;

/*
Explanation:
1. Filters rows for the target skills: WHERE skill IN ('Python', 'Tableau', 'PostgreSQL').
2. Groups by candidate_id.
3. Ensures candidate has all three distinct skills: HAVING COUNT(DISTINCT skill) = 3.
4. Orders by candidate_id ASC.
*/