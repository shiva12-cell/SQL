/*
Question: Spare Server Capacity - Microsoft
URL: https://datalemur.com/questions/sql-spare-server-capacity

Description:
Calculate the spare server capacity available per data center by comparing total server capacity with utilized capacity across running virtual machines.

Tables: datacenters, servers
*/

WITH space_demand AS
(
    SELECT
        datacenter_id,
        SUM(monthly_demand) AS total_monthly_demand
    FROM
        forecasted_demand
    GROUP BY
        datacenter_id
)

SELECT
    dc.datacenter_id,
    (dc.monthly_capacity - sd.total_monthly_demand) AS spare_capacity
FROM
    datacenters AS dc
    INNER JOIN space_demand AS sd
    ON dc.datacenter_id = sd.datacenter_id
ORDER BY
    dc.datacenter_id ASC;

/*
Explanation:
1. Aggregates monthly or current host server consumption across active instances.
2. Subtracts allocated/running capacity from total capacity.
3. Computes spare capacity per data center.
*/