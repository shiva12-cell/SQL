/*
Question: Not Boring Movies
URL: https://leetcode.com/problems/not-boring-movies/

Description:
Report movies with an odd-numbered ID and a description that is not 'boring'. Return the result table ordered by rating in descending order.

Table: Cinema (id INT, movie VARCHAR, description VARCHAR, rating FLOAT)
*/

SELECT 
    id,
    movie,
    description,
    rating
FROM
    cinema
WHERE 
    (id % 2 = 1) 
    AND
    (description != 'boring')
ORDER BY 
    rating DESC
;

/*
Explanation:
1. Checks odd ID condition using modulo: MOD(id, 2) = 1 (or id % 2 = 1).
2. Filters description: description != 'boring'.
3. Orders output: ORDER BY rating DESC.
*/