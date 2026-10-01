/*
Question: Sending vs. Opening Snap - Snapchat
URL: https://datalemur.com/questions/time-spent-snaps

Description:
Calculate the percentage of time spent sending snaps versus opening snaps for each age bucket.
Round the percentages to 2 decimal places.

Tables: activities (activity_id, user_id, type, time_spent, activity_date), age_breakdown (user_id, age_bucket)
*/

SELECT
  R.age_bucket,
  ROUND(100 * SUM(CASE WHEN L.activity_type = 'send' 
                       THEN L.time_spent 
                       ELSE 0 END) / SUM(time_spent), 2) AS send_perc,
  ROUND(100 * SUM(CASE WHEN L.activity_type = 'open' 
                      THEN L.time_spent 
                      ELSE 0 END) / SUM(time_spent), 2) AS open_prec
FROM 
  activities AS L   
JOIN 
  age_breakdown AS R   
ON
  L.user_id = R.user_id
WHERE
  L.activity_type IN ('open', 'send')
GROUP BY 1
;

/*
Explanation:
1. Joins ctivities a with ge_breakdown ab on .user_id = ab.user_id.
2. Filters for type IN ('send', 'open').
3. Sums send time and open time conditionally using CASE WHEN.
4. Divides by total time (send_time + open_time) and multiplies by 100.0, rounded to 2 decimals.
5. Groups by b.age_bucket.
*/