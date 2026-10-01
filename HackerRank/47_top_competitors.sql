/*
Question: Top Competitors
URL: https://www.hackerrank.com/challenges/full-score/problem

Description:
Julia just finished conducting a coding contest.
Write a query to print the hacker_id and name of hackers who achieved full scores for more than one challenge.
Order by total number of challenges where hacker got full score descending, then by hacker_id ascending.

Tables: Hackers, Difficulty, Challenges, Submissions
*/

SELECT H.hacker_id, 
       H.name 
FROM   submissions S 
       JOIN challenges C 
         ON S.challenge_id = C.challenge_id 
       JOIN difficulty D 
         ON C.difficulty_level = D.difficulty_level 
       JOIN hackers H 
         ON S.hacker_id = H.hacker_id 
            AND S.score = D.score 
GROUP  BY H.hacker_id, 
          H.name 
HAVING Count(S.hacker_id) > 1 
ORDER  BY Count(S.hacker_id) DESC, 
          S.hacker_id ASC;

/*
Explanation:
1. Joins Submissions to Challenges, Difficulty, and Hackers.
2. Checks full score condition: WHERE Submissions.score = Difficulty.score.
3. Groups by Hackers.hacker_id, Hackers.name.
4. Filters for hackers with > 1 full score using HAVING COUNT(Challenges.challenge_id) > 1.
5. Orders by COUNT(Challenges.challenge_id) DESC, Hackers.hacker_id ASC.
*/