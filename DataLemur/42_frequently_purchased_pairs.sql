/*
Question: Frequently Purchased Pairs - Walmart
URL: https://datalemur.com/questions/frequently-purchased-pairs

Description:
Find pairs of products frequently purchased together in the same order.
Output product pair and count of orders.

Table: order_products
*/

WITH product_transactions AS
(
    SELECT
        t.transaction_id,
        t.product_id,
        p.product_name
    FROM
        transactions AS t
        INNER JOIN products AS p
        ON t.product_id = p.product_id
)

SELECT
    p1.product_name AS product1,
    p2.product_name AS product2,
    COUNT(*) AS combo_num
FROM
    product_transactions AS p1
    INNER JOIN product_transactions AS p2
    ON p1.transaction_id = p2.transaction_id AND p1.product_id > p2.product_id
GROUP BY
    p1.product_name,
    p2.product_name
ORDER BY
    combo_num DESC
LIMIT 3;

/*
Explanation:
1. Performs self-join order_products p1 JOIN order_products p2 ON p1.order_id = p2.order_id AND p1.product_id < p2.product_id.
2. Groups by p1.product_id, p2.product_id.
3. Orders by pair frequency descending.
*/