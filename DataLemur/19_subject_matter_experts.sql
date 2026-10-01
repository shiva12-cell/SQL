/*
Question: Subject Matter Experts - Accenture
URL: https://datalemur.com/questions/subject-matter-experts

Description:
Identify employees who are Subject Matter Experts (SMEs).
An employee is an SME if they have either:
- 8 or more years of experience in a single domain, OR
- 5 or more years of experience across at least two domains.

Table: employee_expertise (employee_id, domain, years_experience)
*/

SELECT 
    employee_id
FROM 
    employee_expertise
GROUP BY
    employee_id
HAVING
    (COUNT(DISTINCT domain) = 2 AND SUM(years_of_experience) >= 12) OR
    (COUNT(DISTINCT domain) = 1 AND SUM(years_of_experience) >= 8);

/*
Explanation:
1. Evaluates domain experience per employee using grouping and conditional filtering.
2. MAX(years_experience) >= 8 OR COUNT(CASE WHEN years_experience >= 5 THEN 1 END) >= 2.
3. Groups by employee_id and filters via HAVING.
*/