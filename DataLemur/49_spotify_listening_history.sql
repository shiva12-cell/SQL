/*
Question: Spotify Listening History - Spotify
URL: https://datalemur.com/questions/spotify-listening-history

Description:
Given historical listening data and today's song plays, calculate the updated cumulative listening history for each user and song.

Tables: songs_history (history_id, user_id, song_id, song_plays), songs_weekly (user_id, song_id, listen_time)
*/

WITH total_plays AS
(
    SELECT
        user_id,
        song_id,
        song_plays
    FROM
        songs_history
    
    UNION ALL
        
    SELECT
        user_id,
        song_id,
        COUNT(song_id)
    FROM
        songs_weekly
    WHERE
        DATE(listen_time) <= '2022-08-04'
    GROUP BY
        user_id,
        song_id
)

SELECT 
    user_id,
    song_id,
    SUM(song_plays) AS song_plays
FROM 
    total_plays
GROUP BY
    user_id,
    song_id
ORDER BY
    song_plays DESC;

/*
Explanation:
1. Performs FULL OUTER JOIN or UNION ALL between songs_history and songs_weekly.
2. Groups by user_id, song_id.
3. Sums total historical plays plus new plays: SUM(plays) AS total_plays.
*/