/*
Question: Exchange Seats
URL: https://leetcode.com/problems/exchange-seats/

Description:
Swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.
Return the result table ordered by id in ascending order.

Table: Seat (id INT, student VARCHAR)
*/

SELECT 
    id,
    CASE WHEN id % 2 != 0 AND id < (SELECT MAX(id) FROM seat) THEN lead_student
         WHEN id % 2 != 0 AND id = (SELECT MAX(id) FROM seat) THEN student
         ELSE lag_student
    END student
FROM (
    SELECT 
        id,
        LAG(student) OVER (ORDER BY id) AS lag_student,
        LEAD(student) OVER (ORDER BY id) AS lead_student,
        student
    FROM 
        seat
) base
;

-- Solution 2, 601 ms
SELECT
    id,
    CASE WHEN MOD(id, 2) = 0 THEN prev_student 
         WHEN next_id IS NOT NULL THEN next_student
         ELSE student
    END AS student
FROM (
    SELECT
        id,
        student,
        LAG(student, 1) OVER(ORDER BY id ASC) prev_student,
        LEAD(student, 1) OVER(ORDER BY id ASC) next_student,
        LEAD(id, 1) OVER(ORDER BY id ASC) next_id
    FROM
        Seat
) T
;

-- Solution 3, 590ms

SELECT
    CASE WHEN MOD(id, 2) = 0 THEN id - 1
         WHEN id < (SELECT MAX(id) FROM Seat) THEN id + 1
         ELSE id
    END AS id,
    student
FROM
     Seat
ORDER BY 
    id ASC
;

/*
Explanation:
1. Uses a CASE expression based on parity and total count:
   - WHEN MOD(id, 2) = 1 AND id = (SELECT COUNT(*) FROM Seat) THEN id (keeps odd last student unchanged).
   - WHEN MOD(id, 2) = 1 THEN id + 1 (advances odd IDs by 1).
   - ELSE id - 1 (decrements even IDs by 1).
2. Selects the modified id as id and the original student name.
3. Sorts by the new id ASC.
*/