/*
Question: Compressed Mode - Alibaba
URL: https://datalemur.com/questions/alibaba-compressed-mode

Description:
You're given a table containing compressed frequency data of item orders.
Find the mode of the distribution (the item_count with the highest order frequency).
If multiple item_counts tie for the mode, return all of them ordered ascending.

Table: items_per_order (item_count, order_occurrences)
*/

SELECT
  item_count 
FROM (
  SELECT
    item_count,
    DENSE_RANK() OVER(ORDER BY order_occurrences DESC) AS rnk 
  FROM 
    items_per_order
) BASE
WHERE rnk = 1
ORDER BY 1
;

/*
Explanation:
1. Finds the maximum occurrence count: (SELECT MAX(order_occurrences) FROM items_per_order).
2. Filters where order_occurrences = (subquery).
3. Selects item_count and orders by item_count ASC.
*/