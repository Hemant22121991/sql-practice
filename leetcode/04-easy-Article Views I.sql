-- ============================================================
-- PLATFORM  : Leetcode
-- PROBLEM   : Article Views I
-- DIFFICULTY: Easy
-- URL       : https://leetcode.com/problems/big-countries/?envType=study-plan-v2&envId=top-sql-50
-- DATE      : 07 Sep 2026
-- ============================================================
-- PROBLEM STATEMENT:
-- Write a solution to find all the authors that viewed at least one of their own articles.

-- Return the result table sorted by id in ascending order.

-- The result format is in the following example.

-- TECHNIQUE USED:
-- Basic Select, WHERE
--
-- TIME TAKEN: 5 minutes (solo, no hints)
-- ============================================================

SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC
;