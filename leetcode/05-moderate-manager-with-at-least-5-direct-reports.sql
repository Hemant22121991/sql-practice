-- ============================================================
-- PLATFORM  : LeedCode
-- PROBLEM   : Managers with at Least 5 Direct Reports
-- DIFFICULTY: Moderate
-- URL       : https://leetcode.com/problems/managers-with-at-least-5-direct-reports/?envType=study-plan-v2&envId=top-sql-50
-- DATE      : 20 July 2026
-- ============================================================
-- PROBLEM STATEMENT:
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the name of an employee, their department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.
 

Write a solution to find managers with at least five direct reports.

Return the result table in any order.


-- TECHNIQUE USED:
--   GROUP BY + HAVING
--
-- TIME TAKEN: 15 minutes (solo, no hints)
-- ============================================================


SELECT e2.name
FROM Employee e1
INNER JOIN Employee e2 
    ON e1.managerId = e2.id
GROUP BY e2.id
HAVING COUNT(e1.id) >= 5
;