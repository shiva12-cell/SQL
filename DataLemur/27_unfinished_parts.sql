/*
Question: Unfinished Parts - Tesla
URL: https://datalemur.com/questions/tesla-unfinished-parts

Description:
Tesla is investigating production bottlenecks and needs to find all parts currently in assembly that have not been finished.
Write a query to determine which parts have begun the assembly process but are not yet finished (finish_date is NULL).

Table: parts_assembly (part, finish_date, assembly_step)
*/

SELECT DISTINCT
    part
FROM
    parts_assembly
WHERE
    finish_date IS NULL;

/*
Explanation:
1. Filters for parts where inish_date IS NULL.
2. Projects unique part names or specific assembly steps: SELECT part, assembly_step FROM parts_assembly WHERE finish_date IS NULL.
*/