/*
Question: Weather Observation Station 20
URL: https://www.hackerrank.com/challenges/weather-observation-station-20/problem

Description:
A median is defined as a number separating the higher half from the lower half of a data set.
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.

Table: STATION
*/

SELECT Round(st.lat_n, 4)
FROM station AS st
WHERE (SELECT Count(lat_n) FROM station WHERE lat_n < st.lat_n) = (SELECT Count(lat_n) FROM station WHERE lat_n > st.lat_n);

/*
Explanation:
1. Uses window functions ROW_NUMBER() OVER (ORDER BY LAT_N) and COUNT(*) OVER () to rank rows and locate the middle element(s).
2. For odd counts, the median is the single middle row; for even counts, it is the average of the two middle rows.
3. Rounds result to 4 decimal places using ROUND(..., 4).
*/