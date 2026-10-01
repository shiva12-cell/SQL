/*
Question: Top 5 Artists - Spotify
URL: https://datalemur.com/questions/top-fans-rank

Description:
Write a query to find the top 5 artists whose songs appear most frequently in the Top 10 of the global_song_rank table.
Output the artist name and their artist rank (top 1 through top 5). If there are ties, assign the same rank and do not skip ranks (dense rank).

Tables: artists, songs, global_song_rank
*/

WITH artist_top10_appearance AS
(
    SELECT
        a.artist_name,
        COUNT(a.artist_name) AS appearance
    FROM
        global_song_rank AS gsr
        INNER JOIN songs AS s
        ON gsr.song_id = s.song_id
        INNER JOIN artists AS a
        ON s.artist_id = a.artist_id
    WHERE
        gsr.rank <= 10
    GROUP BY
        a.artist_name
),

artist_ranking AS
(
    SELECT
        artist_name,
        appearance,
        DENSE_RANK() OVER(ORDER BY appearance DESC) AS artist_rank
    FROM
        artist_top10_appearance
)

SELECT
    artist_name,
    artist_rank
FROM
    artist_ranking
WHERE
    artist_rank <= 5;

/*
Explanation:
1. Joins rtists a -> songs s -> global_song_rank gsr.
2. Filters for top 10 songs: WHERE gsr.rank <= 10.
3. Groups by .artist_name and counts qualifying appearances: COUNT(s.song_id).
4. Uses DENSE_RANK() OVER (ORDER BY COUNT(s.song_id) DESC) AS artist_rank.
5. Filters where rtist_rank <= 5.
*/