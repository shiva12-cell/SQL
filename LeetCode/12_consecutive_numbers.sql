/*
Question: Consecutive Numbers
URL: https://leetcode.com/problems/consecutive-numbers/

Description:
Find all numbers that appear at least three times consecutively.
Return the result table in any order.

Table: Logs (id INT, num VARCHAR)
*/

SELECT 
    Num AS ConsecutiveNums
FROM (
    SELECT 
        Num,
        LAG(Num, 1) OVER(ORDER BY Id ASC) lag1,
        LAG(Num, 2) OVER(ORDER BY Id ASC) lag2
    FROM 
        logs
) LAGS
WHERE  
    Num - lag1 = 0
AND
    Num - lag2 = 0
GROUP BY 1
;

/*
Explanation:
1. Uses window functions LAG(num, 1) and LEAD(num, 1) (or LAG(num, 2)) ordered by id.
2. Checks if 
um = prev_num AND num = next_num.
3. Alternatively, performs self joins: Logs l1 JOIN Logs l2 ON l1.id = l2.id - 1 JOIN Logs l3 ON l1.id = l3.id - 2 WHERE l1.num = l2.num AND l2.num = l3.num.
4. Deduplicates using DISTINCT num AS ConsecutiveNums.
*/