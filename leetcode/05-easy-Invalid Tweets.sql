-- ============================================================
-- PLATFORM  : Leetcode
-- PROBLEM   : Invalid Tweets
-- DIFFICULTY: Easy
-- URL       : https://leetcode.com/problems/big-countries/?envType=study-plan-v2&envId=top-sql-50
-- DATE      : 07 Sep 2026
-- ============================================================
-- PROBLEM STATEMENT:
-- Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of 
-- characters used in the content of the tweet is strictly greater than 15.

-- Return the result table in any order.

-- The result format is in the following example.

-- TECHNIQUE USED:
-- Basic Select, WHERE
--
-- TIME TAKEN: 5 minutes (solo, no hints)
-- ============================================================

SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15
;