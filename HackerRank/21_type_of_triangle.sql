/*
Question: Type of Triangle
URL: https://www.hackerrank.com/challenges/what-type-of-triangle/problem

Description:
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths (A, B, C):
- Equilateral: All 3 sides are of equal length.
- Isosceles: Exactly 2 sides are of equal length.
- Scalene: All 3 sides are of differing lengths.
- Not A Triangle: The values of A, B, and C do not form a valid triangle (i.e., A + B <= C or B + C <= A or A + C <= B).

Table: TRIANGLES
Columns: A (INTEGER), B (INTEGER), C (INTEGER)
*/

Select 
CASE
when A + B <= C or A + C <= B or B + C <= A then "Not A Triangle"
when A = B and B = C then "Equilateral"
when A = B or A = C or B = C then "Isosceles"
else "Scalene"
end as triangle_sides
from TRIANGLES

/*
Explanation:
1. Evaluates triangle validity first: CASE WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'.
2. Checks for Equilateral: WHEN A = B AND B = C THEN 'Equilateral'.
3. Checks for Isosceles: WHEN A = B OR B = C OR A = C THEN 'Isosceles'.
4. Default fallback: ELSE 'Scalene'.
5. The order of evaluation in CASE statements is critical to correctly classify degenerate triangles first.
*/