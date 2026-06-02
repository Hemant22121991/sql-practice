-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : Highest-Grossing Items
-- DIFFICULTY: moderate
-- URL       : https://datalemur.com/questions/sql-highest-grossing
-- DATE      : 02-06-2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* Assume you're given a table containing data on Amazon customers and their spending on products in different category, 
    write a query to identify the top two highest-grossing products within each category in the year 2022. T
    he output should include the category, product, and total spend. */

-- TECHNIQUE USED:
-- CTE and window function

-- TIME TAKEN: 10 minutes (solo, no hints)
-- ============================================================

-- Find out top 2 products withing each category for 2022 based on total spend
-- output column with category, product and total spend

WITH agg_cat AS (
SELECT
  category,
  product,
  SUM(spend) AS total_spend
FROM product_spend
WHERE YEAR(transaction_date) = '2022'
GROUP BY 1,2
ORDER BY category, total_spend DESC),

catory_ranked AS (
SELECT 
  *,
  RANK() OVER(PARTITION BY CATEGORY ORDER BY total_spend DESC) AS rn
FROM agg_cat)

SELECT
  category,
  product,
  total_spend
FROM catory_ranked
WHERE rn IN (1,2)
;