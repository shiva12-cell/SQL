/*
Question: Fill Missing Client Data - Accenture
URL: https://datalemur.com/questions/fill-missing-product

Description:
Forward-fill missing product category values in a dataset where NULL categories should inherit the category from the most recent preceding valid row.

Table: products (product_id, category, name)
*/

WITH grouped_products AS
(
    SELECT
        product_id,
        category,
        name,
        COUNT(category) OVER (ORDER BY product_id) AS category_group
    FROM products
)

SELECT
    product_id,
    CASE
        WHEN category IS NULL THEN FIRST_VALUE(category) OVER (PARTITION BY category_group)
        ELSE category
    END AS category,
    name
FROM
    grouped_products

/*
Explanation:
1. Uses window function COUNT(category) OVER (ORDER BY product_id) to create constant group partitions for contiguous missing values.
2. Uses FIRST_VALUE(category) OVER (PARTITION BY grp ORDER BY product_id) to forward fill.
3. Populates missing values with the last observed non-null category.
*/