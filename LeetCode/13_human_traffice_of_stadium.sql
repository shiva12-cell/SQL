/*
Question: Human Traffice Of Stadium
URL: https://leetcode.com/problems/human-traffic-of-stadium/

Description:
Display the records with three or more rows with consecutive id's, and the number of people is greater than or equal to 100 for each.
Return the result table ordered by visit_date in ascending order.

Table: Stadium (id INT, visit_date DATE, people INT)
*/

SELECT 
    id,
    visit_date,
    people
FROM (
    SELECT 
        id,
        LAG(id,1) OVER(ORDER BY id ASC) AS lag_id,
        LAG(id,2) OVER(ORDER BY id ASC) AS lag2_id,
        LEAD(id,1) OVER(ORDER BY id ASC) AS lead_id,
        LEAD(id,2) OVER(ORDER BY id ASC) AS lead2_id,
        visit_date,
        people
    FROM 
        Stadium
    WHERE
        people >= 100
) A
WHERE (
    ((id = lead_id - 1) AND (id = lead2_id - 2))
OR
    ((id = lag_id + 1) AND (id = lag2_id + 2))
OR 
    ((id = lag_id + 1)  AND (id = lead_id - 1))
)
ORDER BY 
    visit_date

/*
Explanation:
1. Filters rows with people >= 100.
2. Uses islands-and-gaps technique: id - ROW_NUMBER() OVER (ORDER BY id) creates a constant group identifier for contiguous IDs.
3. Uses COUNT(*) OVER (PARTITION BY (id - rn)) to count the length of each consecutive streak.
4. Retains only streaks where count >= 3, sorted by isit_date ASC.
*/