/*
Question: Tweets' Rolling Averages - Twitter
URL: https://datalemur.com/questions/rolling-average-tweets

Description:
Given a table of tweet counts per user per day, write a query to calculate the 3-day rolling average of tweets for each user.
Output user_id, tweet_date, and rolling average rounded to 2 decimal places.

Table: tweets (user_id, tweet_date, tweet_count)
*/

WITH tweet_posts AS
(
    SELECT
        user_id,
        tweet_date,
        COUNT(tweet_id) AS tweet_count
    FROM
        tweets
    GROUP BY
        user_id,
        tweet_date
)

SELECT
    user_id,
    tweet_date,
    ROUND(
        AVG(tweet_count) OVER (PARTITION BY user_id ORDER BY tweet_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),
        2
    ) AS rolling_avg_3days
FROM
    tweet_posts;

/*
Explanation:
1. Uses window frame specification:
   AVG(tweet_count) OVER (PARTITION BY user_id ORDER BY tweet_date ASC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS rolling_avg_3d.
2. Rounds to 2 decimal places using ROUND(..., 2).
3. Automatically calculates average over 1, 2, or 3 days as data accumulates.
*/