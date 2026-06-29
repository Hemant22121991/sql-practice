-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : Histogram of Users and Purchases
-- DIFFICULTY: medium
-- URL       : https://datalemur.com/questions/histogram-users-purchases
-- DATE      : 29 June 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* Assume you're given a table on Walmart user transactions. Based on their most recent transaction date, 
	   write a query that retrieve the users along with the number of products they bought.
	   Output the user's most recent transaction date, user ID, and the number of products, 
	   sorted in chronological order by the transaction date.
     */

-- TECHNIQUE USED:
-- CTE, Window function and filter

-- TIME TAKEN: 10 minutes (Took hints)
-- ============================================================

WITH agg_table AS (
SELECT
    transaction_date,
    user_id,
    COUNT(product_id) AS purchase_count
  FROM user_transactions
  GROUP BY 2,1
  ORDER BY transaction_date),
  
numbered_table AS (SELECT
  *,
  ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) AS rn
FROM agg_table)

SELECT
  transaction_date,
  user_id,
  purchase_count
FROM numbered_table
WHERE rn = 1
ORDER BY transaction_date
;