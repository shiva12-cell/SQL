/*
Question: Average Review Ratings - Amazon
URL: https://datalemur.com/questions/sql-avg-review-ratings

Description:
Retrieve average monthly product review ratings from the reviews table.
Output month, product_id, and average rating rounded to 2 decimal places.

Table: reviews
*/

SELECT
    DATE_PART('month', submit_date) AS mth,
    product_id AS product,
    ROUND(AVG(stars), 2) AS avg_stars
FROM
    reviews
GROUP BY
    DATE_PART('month', submit_date),
    product_id
ORDER BY
    mth ASC,
    product ASC;

/*
Explanation:
1. Extracts month: DATE_PART('month', submit_date) AS mth.
2. Groups by mth, product_id.
3. Calculates ROUND(AVG(stars), 2) AS avg_stars.
4. Orders by mth, product_id.
*/