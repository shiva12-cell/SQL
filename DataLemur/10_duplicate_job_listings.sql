/*
Question: Duplicate Job Listings - LinkedIn
URL: https://datalemur.com/questions/duplicate-job-listings

Description:
Assume you're given a table containing job postings from companies on LinkedIn.
Write a query to retrieve the number of companies that have posted duplicate job listings.
Duplicate job listings are defined as two or more job postings with the exact same title and description by the same company.

Table: job_listings (job_id, company_id, title, description, post_date)
*/

WITH duplicated_listings AS
(
    SELECT
        company_id,
        title,
        description,
        COUNT(job_id) AS job_postings
    FROM
        job_listings
    GROUP BY
        company_id,
        title,
        description
    HAVING
        COUNT(job_id) > 1
)

SELECT
    COUNT(DISTINCT company_id) AS duplicate_companies
FROM
    duplicated_listings;

/*
Explanation:
1. CTE groups by company_id, title, description and counts job occurrences.
2. Filters HAVING COUNT(job_id) > 1 to find companies with duplicate job postings.
3. Outer query counts COUNT(DISTINCT company_id) AS duplicate_companies.
*/