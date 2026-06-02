-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : Sending vs. Opening Snaps
-- DIFFICULTY: moderate
-- URL       : https://datalemur.com/questions/time-spent-snaps
-- DATE      : 02-06-2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* Assume you're given tables with information on Snapchat users, including their ages and time spent sending and opening snaps.
	Write a query to obtain a breakdown of the time spent sending vs. 
    opening snaps as a percentage of total time spent on these activities grouped by age group. Round the percentage to 2 decimal places in the output.
	Notes:
	Calculate the following percentages:
	time spent sending / (Time spent sending + Time spent opening)
	Time spent opening / (Time spent sending + Time spent opening)
	To avoid integer division in percentages, multiply by 100.0 and not 100. */

-- TECHNIQUE USED:
-- CTE and Aggregation

-- TIME TAKEN: 15 minutes (solo, no hints)
-- ============================================================

WITH act_agg AS (SELECT
  user_id,
  activity_type,
  SUM(time_spent) AS activity_total_time
FROM activities
WHERE activity_type IN ('open','send')
GROUP BY 1,2)

SELECT 
  age_bucket,
  ROUND(SUM(CASE WHEN activity_type = 'send' THEN activity_total_time ELSE 0 END)
  /SUM(activity_total_time) * 100,2) AS	send_perc,
  ROUND(SUM(CASE WHEN activity_type = 'open' THEN activity_total_time ELSE 0 END)
  /SUM(activity_total_time) * 100,2) AS	send_perc
FROM age_breakdown AS ab
JOIN act_agg AS aa
  ON ab.user_id = aa.user_id
GROUP BY 1
;