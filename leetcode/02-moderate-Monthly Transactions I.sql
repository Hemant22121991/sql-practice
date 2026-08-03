-- ============================================================
-- PLATFORM  : LeedCode
-- PROBLEM   : Monthly Transactions I
-- DIFFICULTY: moderate
-- URL       : https://leetcode.com/problems/monthly-transactions-i/description/?envType=study-plan-v2&envId=top-sql-50
-- DATE      : 20 July 2026
-- ============================================================
-- PROBLEM STATEMENT:
Table: Transactions

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| country       | varchar |
| state         | enum    |
| amount        | int     |
| trans_date    | date    |
+---------------+---------+
id is the primary key of this table.
The table has information about incoming transactions.
The state column is an enum of type ["approved", "declined"].
 

Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

Return the result table in any order.



The result format is in the following example.

-- TECHNIQUE USED:
--   Column Pivot
--
-- TIME TAKEN: 10 minutes (solo, no hints)
-- ============================================================

SELECT
    DATE_FORMAT(trans_date,'%Y-%m') AS month,
    country,
    COUNT(*) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY 1,2
;