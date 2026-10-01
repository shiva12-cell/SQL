/*
Question: Average Review Ratings - Amazon
URL: https://datalemur.com/questions/sql-avg-review-ratings

Description:
Given the reviews table, write a query to retrieve the average star rating for each product, grouped by month.
The output should display the month as a numerical value, product ID, and average star rating rounded to two decimal places.
Sort the output by month and then by product id in ascending order.

Table: reviews (review_id, user_id, submit_date, product_id, stars)
*/

SELECT
  EXTRACT(MONTH FROM submit_date) AS mth,
  product_id AS product,
  ROUND(AVG(stars), 2) AS avg_stars
FROM
  reviews
GROUP BY 1, 2 
ORDER BY 1, 2
;

/*
Explanation:
1. Extracts month from submit_date: EXTRACT(MONTH FROM submit_date) AS mth.
2. Groups by EXTRACT(MONTH FROM submit_date), product_id.
3. Calculates average rating: ROUND(AVG(stars), 2) AS avg_stars.
4. Orders by mth ASC, product_id ASC.
*/