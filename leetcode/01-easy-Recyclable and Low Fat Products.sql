-- ============================================================
-- PLATFORM  : Leetcode
-- PROBLEM   : Recyclable and Low Fat Products
-- DIFFICULTY: Easy
-- URL       : https://leetcode.com/problems/recyclable-and-low-fat-products/?envType=study-plan-v2&envId=top-sql-50
-- DATE      : 07 Sep 2026
-- ============================================================
-- PROBLEM STATEMENT:
-- Write a solution to find the ids of products that are both low fat and recyclable.
-- Return the result table in any order.
-- The result format is in the following example

-- TECHNIQUE USED:
-- Basic Select, WHERE
--
-- TIME TAKEN: 5 minutes (solo, no hints)
-- ============================================================

SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y'
;