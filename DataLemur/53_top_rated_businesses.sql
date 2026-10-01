/*
Question: Top Rated Businesses - Yelp
URL: https://datalemur.com/questions/sql-top-businesses

Description:
Find the number of top-rated businesses (review stars >= 4) and the percentage of all businesses that are top-rated.
Round the percentage to 0 or 2 decimal places.

Table: reviews
*/

SELECT
    SUM(CASE WHEN review_stars IN (4, 5) THEN 1 ELSE 0 END) AS business_num,
    ROUND(
        100 * 
        (SUM
            (CASE WHEN review_stars IN (4, 5) THEN 1 ELSE 0 END)::NUMERIC / 
            COUNT(business_id)
        ), 
    2) AS top_business_pct
FROM
    reviews;

/*
Explanation:
1. Groups by business to get average review stars.
2. Filters or aggregates businesses with average stars >= 4.
3. Computes top-rated count and percentage of total businesses.
*/