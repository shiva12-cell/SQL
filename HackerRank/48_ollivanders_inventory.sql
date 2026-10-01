/*
Question: Ollivander's Inventory
URL: https://www.hackerrank.com/challenges/harry-potter-and-wands/problem

Description:
Harry Potter and his friends are at Ollivander's.
Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in (not evil: is_evil = 0).
Find the minimum number of gold galleons needed to buy each non-evil wand of high power and age.
Order by power descending, then age descending.

Tables: Wands, Wands_Property
*/

SELECT a.id, 
       b.age, 
       a.coins_needed, 
       a.power 
FROM   wands a 
       JOIN wands_property b 
         ON a.code = b.code 
WHERE  b.is_evil = 0 
       AND a.coins_needed = (SELECT Min(a1.coins_needed) 
                             FROM   wands a1 
                                    JOIN wands_property b1 
                                      ON a1.code = b1.code 
                             WHERE  b.age = b1.age 
                                    AND a.power = a1.power) 
ORDER  BY a.power DESC, 
          b.age DESC;

/*
Explanation:
1. Joins Wands w and Wands_Property p on w.code = p.code.
2. Filters for non-evil wands (p.is_evil = 0).
3. Employs a correlated subquery or window function ROW_NUMBER() OVER (PARTITION BY p.age, w.power ORDER BY w.coins_needed ASC) to select the wand with the minimum coins needed for each (age, power) pair.
4. Orders results by w.power DESC, p.age DESC.
*/