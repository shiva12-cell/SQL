/*
Question: Teams Power Users - Microsoft
URL: https://datalemur.com/questions/teams-power-users

Description:
Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022.
Display the IDs of these 2 users along with the total number of messages they sent. Sort by total messages in descending order.

Table: messages (message_id, sender_id, receiver_id, content, sent_date)
*/

SELECT
    sender_id,
    COUNT(message_id) AS message_count
FROM
    messages
WHERE
    DATE_PART('year', sent_date) = 2022 AND
    DATE_PART('month', sent_date) = 8
GROUP BY
    sender_id
ORDER BY
    message_count DESC
LIMIT 2;

/*
Explanation:
1. Filters messages sent in August 2022: sent_date >= '2022-08-01' AND sent_date < '2022-09-01'.
2. Groups by sender_id.
3. Computes COUNT(message_id) AS message_count.
4. Orders by message_count DESC LIMIT 2.
*/