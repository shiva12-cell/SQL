/*
Question: Trips and Users
URL: https://leetcode.com/problems/trips-and-users/

Description:
Calculate the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between '2013-10-01' and '2013-10-03'.
Cancellation rate = (canceled by client or driver) / (total unbanned requests). Round to 2 decimal places.

Tables: Trips (id, client_id, driver_id, city_id, status, request_at), Users (users_id, banned, role)
*/

SELECT 
    L.request_at AS Day,
    ROUND(SUM(CASE WHEN L.status != 'completed' THEN 1 ELSE 0 END) /COUNT(1),2) AS 'Cancellation Rate'
FROM
    Trips AS L
JOIN 
( SELECT 
    users_id AS client_id
  FROM 
    Users
  WHERE
    banned = 'No'
  AND
    role IN ('client')
) R1
ON 
    L.client_id = R1.client_id
JOIN (
  SELECT
    users_id AS driver_id
  FROM 
    Users
  WHERE
    role IN ('driver')
  AND 
   banned = 'No'
) R2
ON 
    L.driver_id = R2.driver_id 
WHERE
    request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY 1
;

/*
Explanation:
1. Joins Trips to Users twice: once for client (client_id = u1.users_id AND u1.banned = 'No') and once for driver (driver_id = u2.users_id AND u2.banned = 'No').
2. Restricts dates: equest_at BETWEEN '2013-10-01' AND '2013-10-03'.
3. Calculates cancellation rate using conditional sum:
   ROUND(SUM(CASE WHEN status != 'completed' THEN 1 ELSE 0 END) / COUNT(*), 2) AS 'Cancellation Rate'.
4. Groups by equest_at AS Day.
*/