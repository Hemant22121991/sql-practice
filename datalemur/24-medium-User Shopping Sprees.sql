-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : User Shopping Sprees
-- DIFFICULTY: medium
-- URL       : https://datalemur.com/questions/amazon-shopping-spree
-- DATE      : 15 June 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* In an effort to identify high-value customers, Amazon asked for your help to obtain data about users who 
       go on shopping sprees. A shopping spree occurs when a user makes purchases on 3 or more consecutive days.
       List the user IDs who have gone on at least 1 shopping spree in ascending order.
     */

-- TECHNIQUE USED:
-- subquery, window function and filtering

-- TIME TAKEN: 10 minutes (solo, no hints)
-- ============================================================

SELECT user_id
FROM (SELECT 
 *,
 ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS rn
FROM transactions) AS ranked_table
WHERE rn>=3
;