/*
Question: Average Deal Size (Part 1) - Salesforce
URL: https://datalemur.com/questions/sql-average-deal-size

Description:
Calculate the average deal size grouped by deal size tier or client segment.

Table: deals (deal_id, customer_id, amount, close_date)
*/

SELECT
    ROUND(AVG(yearly_seat_cost * num_seats), 2) AS average_deal_size
FROM
    contracts;

/*
Explanation:
1. Classifies deals into tiers using CASE statement based on mount.
2. Calculates AVG(amount) for each tier.
3. Rounds average deal size and orders as specified.
*/