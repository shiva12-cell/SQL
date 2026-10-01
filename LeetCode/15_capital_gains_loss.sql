/*
Question: Capital Gains/Loss
URL: https://leetcode.com/problems/capital-gainloss/

Description:
Report the Capital Gain/Loss for each stock.
The Capital Gain/Loss of a stock is the total gain or loss after buying and selling the stock one or many times.

Table: Stocks (stock_name VARCHAR, operation ENUM('Buy', 'Sell'), operation_day INT, price INT)
*/

SELECT
    stock_name,
    total_sell - total_buy AS capital_gain_loss
FROM (
SELECT
    stock_name,
    SUM(CASE WHEN operation = 'Buy' THEN price ELSE 0 END) AS total_buy,
    SUM(CASE WHEN operation = 'Sell' THEN price ELSE 0 END) AS total_sell
FROM
    Stocks
GROUP BY 1
) T
;

-- or

SELECT
    stock_name,
    SUM(CASE WHEN operation = 'Buy' THEN -price
             ELSE price 
        END) AS capital_gain_loss
FROM
    Stocks
GROUP BY 1
;

/*
Explanation:
1. Uses conditional aggregation with CASE:
   SUM(CASE WHEN operation = 'Buy' THEN -price ELSE price END) AS capital_gain_loss.
2. Groups by stock_name.
3. Automatically nets out all buys as outflows and all sells as inflows.
*/