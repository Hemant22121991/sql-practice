-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : Cities With Completed Trades
-- DIFFICULTY: easy
-- URL       : https://datalemur.com/questions/completed-trades
-- DATE      : 30 May 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* Assume you're given the tables containing completed trade orders and user details in a Robinhood trading system.
	Write a query to retrieve the top three cities that have the highest number of completed trade orders listed in descending order. 
    Output the city name and the corresponding number of completed trade orders. */

-- TECHNIQUE USED:
-- aggregation & filter

-- TIME TAKEN: 5 minutes (solo, no hints)

-- ============================================================

SELECT
  u.city,
  COUNT(t.order_id) AS total_orders
FROM trades AS t
JOIN users AS u
  ON t.user_id = u.user_id
WHERE status = 'Completed'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3
;