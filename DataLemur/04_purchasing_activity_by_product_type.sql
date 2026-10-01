/*
Question: Purchasing Activity by Product Type - Amazon
URL: https://datalemur.com/questions/sql-purchasing-activity

Description:
Analyze total spending across different product categories/types and order the output to show category-level revenue contributions.

Tables: orders, products
*/

SELECT
    t1.order_date,
    t1.product_type,
    (
        SELECT
            SUM(quantity)
        FROM
            total_trans AS t2
        WHERE
            t2.order_date <= t1.order_date AND
            t2.product_type = t1.product_type
    ) AS cum_purchased
FROM
    total_trans AS t1;

/*
Explanation:
1. Joins orders to products on product_id.
2. Groups by product category/type.
3. Calculates total spending using SUM(price * quantity) or total revenue.
4. Orders by total spend descending.
*/