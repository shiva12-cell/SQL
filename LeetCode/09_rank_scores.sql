/*
Question: Rank Scores
URL: https://leetcode.com/problems/rank-scores/

Description:
Find the rank of the scores. The ranking should be calculated according to the following rules:
- The scores should be ranked from the highest to the lowest.
- If there is a tie between two scores, both should have the same ranking.
- After a tie, the next ranking number should be the next consecutive integer value (no holes in ranking).

Table: Scores (id INT, score DECIMAL(3,2))
*/

SELECT 
    Score as score,
    DENSE_RANK() OVER(ORDER BY Score DESC) AS `Rank`
FROM
    Scores
;

/*
Explanation:
1. Uses the standard ANSI SQL window function DENSE_RANK() OVER (ORDER BY score DESC) as ank.
2. DENSE_RANK() guarantees consecutive rankings without gaps when scores tie.
3. Selects score, DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'.
*/