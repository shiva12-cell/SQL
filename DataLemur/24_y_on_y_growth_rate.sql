/*
Question: Y-on-Y Growth Rate - Wayfair
URL: https://datalemur.com/questions/yoy-growth-rate

Description:
Assume you're given a table containing information on Wayfair user transactions.
Write a query to calculate the year-on-year (YoY) growth rate for total spend for each product.
Output year, product_id, current year's spend, previous year's spend, and YoY growth rate percentage rounded to 2 decimal places.

Table: user_transactions (transaction_id, product_id, spend, transaction_date)
*/

WITH product_by_year AS ( 
SELECT
  year, 
  product_id,
  curr_year_spend,
  LAG(curr_year_spend, 1) OVER (
        PARTITION BY product_id ORDER BY YEAR ASC) AS prev_year_spend
FROM (
  SELECT
    EXTRACT(YEAR FROM transaction_date) AS year,
    product_id,
    SUM(spend) AS curr_year_spend
  FROM 
    user_transactions
  GROUP BY 
    product_id,
    year
  ) BASE
);

SELECT 
  year,
  product_id,
  curr_year_spend,
  prev_year_spend,
  ROUND(100 * (curr_year_spend - prev_year_spend ) / prev_year_spend, 2) AS yoy_rate
FROM 
    product_by_year
;

/*
Explanation:
1. First CTE groups by EXTRACT(YEAR FROM transaction_date) AS year, product_id and sums SUM(spend) AS curr_year_spend.
2. Uses window function LAG(curr_year_spend, 1) OVER (PARTITION BY product_id ORDER BY year ASC) to obtain prev_year_spend.
3. Calculates growth rate: ROUND(100.0 * (curr_year_spend - prev_year_spend) / prev_year_spend, 2) AS yoy_rate.
4. Orders by product_id, year.
*/