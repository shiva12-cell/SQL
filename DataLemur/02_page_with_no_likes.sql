/*
Question: Page With No Likes - Facebook
URL: https://datalemur.com/questions/sql-page-with-no-likes

Description:
Write a query to return the IDs of the Facebook pages that have zero likes. The output should be in ascending order of page_id.

Tables: pages (page_id, page_name), page_likes (user_id, page_id, liked_date)
*/

SELECT
    p.page_id
FROM
    pages as p
    LEFT JOIN page_likes AS pl
    ON p.page_id = pl.page_id
WHERE
    pl.page_id IS NULL;

/*
Explanation:
1. Performs LEFT JOIN page_likes l ON p.page_id = l.page_id.
2. Filters where l.page_id IS NULL to identify pages that have never received a like.
3. Selects p.page_id ordered by p.page_id ASC.
*/