/*
Question: The PADS
URL: https://www.hackerrank.com/challenges/the-pads/problem

Description:
Generate two result sets:
1. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (e.g.: Name(D)).
2. Query the number of occurrences of each occupation in OCCUPATIONS. Format: 'There are a total of [count] [occupation]s.' Order by count ascending, then alphabetically by occupation.

Table: OCCUPATIONS
Columns: Name (STRING), Occupation (STRING)
*/

select concat(name,'(',substring(Occupation,1,1),')') as Name 
from occupations 
order by Name;
Select concat ('There are a total of ', count(occupation),' ', lower(occupation),'s.') as totals
from occupations
group by occupation
order by totals

/*
Explanation:
1. First query: Uses string concatenation CONCAT(Name, '(', LEFT(Occupation, 1), ')') ordered alphabetically by Name.
2. Second query: Groups by Occupation, computes COUNT(*), and formats output with CONCAT('There are a total of ', COUNT(*), ' ', LOWER(Occupation), 's.'), ordering by COUNT(*) ASC, LOWER(Occupation) ASC.
*/