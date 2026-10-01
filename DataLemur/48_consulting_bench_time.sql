/*
Question: Consulting Bench Time - Google
URL: https://datalemur.com/questions/consulting-bench-time

Description:
Calculate the total unbillable bench time in days for consultants across clients in a 365-day period.

Tables: staffing, consulting_engagements
*/

WITH consulting_days_tbl AS
(
    SELECT
        s.employee_id,
        (ce.end_date - ce.start_date) + 1 AS non_bench_days
    FROM
        staffing AS s
        INNER JOIN consulting_engagements AS ce
        ON s.job_id = ce.job_id
    WHERE
        s.is_consultant = 'true'
)

SELECT
    employee_id,
    365 - SUM(non_bench_days) AS bench_days
FROM
    consulting_days_tbl
GROUP BY
    employee_id;

/*
Explanation:
1. Computes total engagement days per consultant.
2. Subtracts engaged days from 365 (inclusive calendar duration).
3. Sums bench days per consultant.
*/