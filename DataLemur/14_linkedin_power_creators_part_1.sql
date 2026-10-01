/*
Question: LinkedIn Power Creators (Part 1) - LinkedIn
URL: https://datalemur.com/questions/linkedin-power-creators

Description:
The LinkedIn Creator team wants to identify 'Power Creators'.
A Power Creator is someone who has more LinkedIn followers than each of the companies they work for.
Write a query to return the IDs of these LinkedIn Power Creators in ascending order.

Tables: personal_profiles (profile_id, name, followers), employee_company (personal_profile_id, company_id), company_pages (company_id, name, followers)
*/

SELECT
    p.profile_id
FROM
    personal_profiles AS p
    INNER JOIN company_pages AS c
    ON p.employer_id = c.company_id
WHERE
    p.followers > c.followers
ORDER BY
    p.profile_id ASC;

/*
Explanation:
1. Joins personal_profiles p to employee_company ec and company_pages c.
2. Groups by creator profile or filters creators where creator's followers exceed company followers for all affiliated companies.
3. Selects profile_id ordered in ascending order.
*/