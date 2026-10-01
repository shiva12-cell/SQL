/*
Question: Matching Skills - LinkedIn
URL: https://datalemur.com/questions/matching-skills

Description:
Find candidates who possess all 3 required data science skills: Python, Tableau, and PostgreSQL.
Output candidate_id ordered by candidate_id asc.

Table: candidates (candidate_id, skill)
*/

SELECT
  candidate_id
FROM  (
SELECT 
  candidate_id,
  ARRAY_AGG(skill) AS skills
FROM 
  candidates
GROUP BY 1
) A 
WHERE 
  'Python'=ANY(skills)
AND
  'Tableau'=ANY(skills)
AND
  'PostgreSQL'=ANY(skills)
;

/*
Explanation:
1. Filters for the 3 target skills: WHERE skill IN ('Python', 'Tableau', 'PostgreSQL').
2. Groups by candidate_id and verifies complete coverage: HAVING COUNT(DISTINCT skill) = 3.
3. Sorts results with ORDER BY candidate_id ASC.
*/