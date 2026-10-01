/*
Question: Average Post Hiatus (Part 1) - Facebook
URL: https://datalemur.com/questions/sql-average-post-hiatus-1

Description:
Find the number of days between each user's first post of the year and last post of the year in the year 2021.
Only output users who posted at least twice in 2021. Output user_id and days_between.

Table: posts (user_id, post_id, post_date, post_content)
*/

SELECT
  user_id,
  MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM
  posts
WHERE
  DATE_PART('year', post_date) = 2021
GROUP BY
  user_id
HAVING
  COUNT(post_id) > 1;

/*
Explanation:
1. Filters posts created in 2021: post_date >= '2021-01-01' AND post_date < '2022-01-01'.
2. Groups by user_id.
3. Filters for multiple posts: HAVING COUNT(post_id) >= 2.
4. Calculates days between first and last post: DATE_PART('day', MAX(post_date) - MIN(post_date)) (or DATEDIFF(MAX(post_date), MIN(post_date))).
*/