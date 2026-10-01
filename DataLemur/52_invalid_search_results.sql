/*
Question: Invalid Search Results - Google
URL: https://datalemur.com/questions/invalid-search-pct

Description:
Calculate the percentage of searches with invalid search results (0 results or invalid query formats).

Table: search_events
*/

WITH search_details AS
(
    SELECT
        country,
        SUM(num_search) AS total_search,
        SUM(num_search * (invalid_result_pct/100)) AS invalid_searches
    FROM
        search_category
    WHERE
        num_search IS NOT NULL AND invalid_result_pct IS NOT NULL
    GROUP BY
        country
)

SELECT 
    country, 
    total_search, 
    ROUND(invalid_searches/total_search * 100.0,2) invalid_result_pct
FROM 
    search_details;

/*
Explanation:
1. Filters searches with invalid or zero results: CASE WHEN num_results = 0 OR is_invalid = 1 THEN 1 ELSE 0 END.
2. Calculates ROUND(100.0 * invalid_searches / total_searches, 2) AS invalid_pct.
*/