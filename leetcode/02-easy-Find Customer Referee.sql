-- ============================================================
-- PLATFORM  : Leetcode
-- PROBLEM   : Find Customer Referee
-- DIFFICULTY: Easy
-- URL       : https://leetcode.com/problems/find-customer-referee/?envType=study-plan-v2&envId=top-sql-50
-- DATE      : 07 Sep 2026
-- ============================================================
-- PROBLEM STATEMENT:
-- Find the names of the customer that are either:
-- referred by any customer with id != 2.
-- not referred by any customer.
-- Return the result table in any order.
-- The result format is in the following example

-- TECHNIQUE USED:
-- Basic Select, WHERE
--
-- TIME TAKEN: 5 minutes (solo, no hints)
-- ============================================================

SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL
;