/*
Question: Page With No Likes - Facebook
URL: https://datalemur.com/questions/sql-page-with-no-likes

Description:
Find Facebook pages with zero likes. Return page_id ordered ascending.

Tables: pages, page_likes
*/

SELECT
  L.page_id
FROM 
  pages AS L 
LEFT JOIN 
  page_likes AS R 
ON
  L.page_id = R.page_id
WHERE 
  R.liked_date IS NULL
ORDER BY 
  page_id
;

/*
Explanation:
1. Performs LEFT JOIN on page_likes and checks for NULL.
2. Alternatively uses WHERE page_id NOT IN (SELECT page_id FROM page_likes).
3. Sorts by page_id ASC.
*/