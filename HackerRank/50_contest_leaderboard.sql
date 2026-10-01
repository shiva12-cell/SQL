/*
Question: Contest Leaderboard
URL: https://www.hackerrank.com/challenges/contest-leaderboard/problem

Description:
The total score of a hacker is the sum of their maximum scores for all of the challenges.
Write a query to print the hacker_id, name, and total score of the hackers ordered by the score descending, then by hacker_id ascending.
Exclude all hackers with a total score of 0.

Tables: Hackers, Submissions
*/

SELECT h.hacker_id, h.name, SUM(MAX_SCORE.t1) as total_score
FROM Hackers h inner join 
(
    SELECT MAX(s.score) as t1, s.hacker_id  
    FROM Submissions s
    GROUP BY s.challenge_id, s.hacker_id
    HAVING t1 > 0
) AS MAX_SCORE
ON h.hacker_id = MAX_SCORE.hacker_id
GROUP BY h.hacker_id, h.name
ORDER BY total_score DESC, hacker_id ASC

/*
Explanation:
1. Inner subquery groups by hacker_id, challenge_id and computes MAX(score) for each challenge.
2. Outer query sums these maximum challenge scores per hacker.
3. Joins with Hackers to retrieve hacker name.
4. Filters HAVING SUM(max_score) > 0.
5. Orders by total_score DESC, hacker_id ASC.
*/