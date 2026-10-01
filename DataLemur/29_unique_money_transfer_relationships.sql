/*
Question: Unique Money Transfer Relationships - PayPal
URL: https://datalemur.com/questions/money-transfer-relationships

Description:
Find the total number of unique money transfer relationships between users.
A relationship between User A and User B exists if A transferred to B or B transferred to A.

Table: payments (payer_id, recipient_id, amount)
*/

WITH two_way_rel AS
(
    SELECT
        payer_id AS payer,
        recipient_id AS recipient
    FROM
        payments
    
    INTERSECT
    
    SELECT
        recipient_id AS payer,
        payer_id AS recipient
    FROM
        payments
)

SELECT
    COUNT(payer)/2 AS unique_relationships
FROM
    two_way_rel;

/*
Explanation:
1. Normalizes relationship direction using LEAST(payer_id, recipient_id) AS u1, GREATEST(payer_id, recipient_id) AS u2.
2. Counts distinct normalized pairs: COUNT(DISTINCT CONCAT(LEAST(payer_id, recipient_id), '-', GREATEST(payer_id, recipient_id))).
*/