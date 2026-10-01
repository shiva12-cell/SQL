/*
Question: Highest-Grossing Items - Amazon
URL: https://datalemur.com/questions/sql-highest-grossing

Description:
Write a query to identify the top 2 highest-grossing products within each category in the year 2022.
Output category, product, and total spend.

Table: product_spend (category, product, user_id, spend, transaction_date)
*/

WITH top_sales AS
(
    SELECT
        category,
        product,
        SUM(spend) AS total_spend
    FROM
        product_spend
    WHERE
        DATE_PART('year', transaction_date) = 2022
    GROUP BY
        category,
        product
),

top_sales_ranking AS
(
    SELECT
        category,
        product,
        total_spend,
        DENSE_RANK() OVER(PARTITION BY category ORDER BY total_spend DESC) AS product_rank
    FROM
        top_sales
)

SELECT
    category,
    product,
    total_spend
FROM
    top_sales_ranking
WHERE
    product_rank <= 2;

/*
Explanation:
1. Filters transactions in 2022: transaction_date >= '2022-01-01' AND transaction_date < '2023-01-01'.
2. Sums total spend per category and product: SUM(spend) AS total_spend.
3. Uses window function DENSE_RANK() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) as nk.
4. Filters WHERE rnk <= 2 in the outer query.
*/