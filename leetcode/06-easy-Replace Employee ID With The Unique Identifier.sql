-- ============================================================
-- PLATFORM  : Leetcode
-- PROBLEM   : Replace Employee ID With The Unique Identifier
-- DIFFICULTY: Easy
-- URL       : https://leetcode.com/problems/big-countries/?envType=study-plan-v2&envId=top-sql-50
-- DATE      : 07 Sep 2026
-- ============================================================
-- PROBLEM STATEMENT:
-- Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.

-- Return the result table in any order.

-- The result format is in the following example.

-- TECHNIQUE USED:
-- Basic Select, WHERE
--
-- TIME TAKEN: 5 minutes (solo, no hints)
-- ============================================================

SELECT 
    eu.unique_id,
    e.name
FROM Employees AS e
LEFT JOIN EmployeeUNI AS eu
    ON e.id = eu.id
;