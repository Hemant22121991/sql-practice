-- ============================================================
-- PLATFORM  : LeedCode
-- PROBLEM   : Immediate Food Delivery II
-- DIFFICULTY: moderate
-- URL       : https://leetcode.com/problems/immediate-food-delivery-ii/?envType=study-plan-v2&envId=top-sql-50
-- DATE      : 20 July 2026
-- ============================================================
-- PROBLEM STATEMENT:
Table: Delivery

+-----------------------------+---------+
| Column Name                 | Type    |
+-----------------------------+---------+
| delivery_id                 | int     |
| customer_id                 | int     |
| order_date                  | date    |
| customer_pref_delivery_date | date    |
+-----------------------------+---------+
delivery_id is the column of unique values of this table.
The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery date (on the same order date or after it).
 

If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.

The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.

Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.



-- TECHNIQUE USED:
--   CTE + Window Function
--
-- TIME TAKEN: 10 minutes (solo, no hints)
-- ============================================================

WITH row_num_table AS (
SELECT
    *,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rn
FROM Delivery
ORDER BY customer_id,order_date)

SELECT
    ROUND(100 * SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END)/COUNT(*),2) AS immediate_percentage
FROM row_num_table
WHERE rn = 1
;