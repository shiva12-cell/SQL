/*
Question: Occupations
URL: https://www.hackerrank.com/challenges/occupations/problem

Description:
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation.
The output column headers should be Doctor, Professor, Singer, and Actor.
Note: Print NULL when there are no more names corresponding to an occupation.

Table: OCCUPATIONS
*/

SELECT 
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM (
    SELECT 
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn
    FROM OCCUPATIONS
) AS sub
GROUP BY rn;

/*
Explanation:
1. Uses window function ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) to assign a row index to each person within their occupation group.
2. Uses conditional aggregation (MAX(CASE WHEN Occupation = 'Doctor' THEN Name END), etc.) grouped by the assigned row number.
3. Aligns the names across 4 columns row by row, filling empty slots with NULL.
*/