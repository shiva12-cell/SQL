/*
Question: Histogram of Tweets - Twitter
URL: https://datalemur.com/questions/sql-histogram-tweets

Description:
Write a query to obtain a histogram of tweets posted per user in 2022.
Output the tweet count per user as the bucket (tweet_bucket) and the number of Twitter users who fall into that bucket (users_num).

Table: tweets (tweet_id, user_id, msg, tweet_date)
*/

WITH tweet_counts AS
(
    SELECT
        COUNT(tweet_id) AS tweet_count
    FROM
        tweets
    WHERE
        DATE_PART('year', tweet_date) = 2022
    GROUP BY
        user_id
)

SELECT
    COUNT(tweet_count) AS tweet_bucket,
    tweet_count AS user_num
FROM
    tweet_counts
GROUP BY
    tweet_count
ORDER BY
    tweet_bucket ASC;

/*
Explanation:
1. First CTE groups by user_id where tweet_date >= '2022-01-01' AND tweet_date < '2023-01-01' and counts tweets per user: COUNT(tweet_id) AS tweet_count.
2. Outer query groups by tweet_count AS tweet_bucket and counts users: COUNT(user_id) AS users_num.
3. Produces the distribution histogram.
*/