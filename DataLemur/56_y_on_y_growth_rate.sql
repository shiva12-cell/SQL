/*
Question: Y-on-Y Growth Rate - Wayfair
URL: https://datalemur.com/questions/yoy-growth-rate

Description:
Calculate Year-on-Year (YoY) growth rate in spend for each product.
Output year, product_id, current spend, previous spend, and YoY growth rate percentage.

Table: user_transactions
*/

WITH user_spending AS
(
    SELECT
        DATE_PART('year', transaction_date) AS year,
        product_id,
        spend AS curr_year_spend,
        LAG(spend) OVER(PARTITION BY product_id ORDER BY transaction_date ASC) AS prev_year_spend
    FROM 
        user_transactions
)

SELECT
    year,
    product_id,
    curr_year_spend,
    prev_year_spend,
    CASE
        WHEN prev_year_spend IS NULL THEN NULL
        ELSE 
        ROUND(
            ((curr_year_spend / prev_year_spend)-1) * 100,
            2
        )
    END AS yoy_rate
FROM
    user_spending;

/*
Explanation:
1. Aggregates annual spend per product in a CTE.
2. Uses LAG(curr_year_spend) OVER (PARTITION BY product_id ORDER BY year) to get previous year spend.
3. Computes ROUND(100.0 * (curr_year_spend - prev_year_spend) / prev_year_spend, 2) AS yoy_rate.
*/