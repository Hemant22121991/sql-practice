-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : User's Third Transaction
-- DIFFICULTY: moderate
-- URL       : https://datalemur.com/questions/sql-third-transaction
-- DATE      : 30 May 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* Assume you are given the table below on Uber transactions made by users. 
    Write a query to obtain the third transaction of every user.
    Output the user id, spend and transaction date. */

-- TECHNIQUE USED:
-- Window function and filter

-- TIME TAKEN: 15 minutes (solo, no hints)

-- ============================================================

WITH ranked_transaction AS (
SELECT 
    user_id,
    spend,
    transaction_date,
    ROW_NUMBER() OVER(
      PARTITION BY user_id 
      ORDER BY transaction_date ASC
    ) AS rn
  FROM transactions)
  
SELECT
  user_id,
  spend,
  transaction_date
FROM ranked_transaction
WHERE rn = 3
;
