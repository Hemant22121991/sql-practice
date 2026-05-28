-- ============================================================
-- PLATFORM  : Analyst Builder
-- PROBLEM   : Margin Madness
-- DIFFICULTY: moderate
-- URL       : https://www.analystbuilder.com/questions/margin-madness-LVVjZ
-- DATE      : 28 May 2026
-- ============================================================
-- PROBLEM STATEMENT:

-- Ana started a new cheesecake company which now has a few orders completed!
-- She would like to better understand how profitable she is on average for any given order.
-- To help her calculate this, determine the order profit margin ( (order value - item cost) / order value)
-- Then, average this value across all of her orders.
-- Round the output to 1 decimal places, and append a percent sign (%) to the end (Ana doesn't want to have to do that later manually each time - I know....).

-- TECHNIQUE USED:
-- subquery
--
-- TIME TAKEN: 5 minutes (solo, no hints)

-- MANUFACTURING PARALLEL:
--   Same pattern applies for project profitability analysis
-- ============================================================



-- STEP - 01: Calculate profit margin across all orders
-- STEP - 02: Find Average of profit_margin

-- method used subquery

SELECT AVG(profit_margin) * 100 AS avg_profit_margin
  FROM (
SELECT *,
  (order_value - item_cost)/order_value AS profit_margin
FROM cheesecake_margins) AS pr_mr_tb
;