-- ============================================================
-- PLATFORM  : codebasics
-- PROBLEM   : Product Sales by Store in Bangalore
-- DIFFICULTY: easy
-- URL       : https://codebasics.io/bootcamp-practice-arenas/1/question/6
-- DATE      : 30 May 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/*As a data analyst for a retail chain, 
	you are tasked to find out the total product sold quantity of the store which is located at Bangalore.
	Assumptions:
	Sales data is accurately recorded in the Sales table. Each store's city information is correctly listed in the Stores table. */

-- TECHNIQUE USED:
-- table join and filter
--
-- TIME TAKEN: 10 minutes (solo, no hints)

-- MANUFACTURING PARALLEL:
--   Same pattern applies for finding machine failure event count
-- ============================================================

SELECT
    p.store_name,
    SUM(ps.Quantity) AS total_product_sold
FROM product_stores AS p
INNER JOIN product_sales AS ps
    ON p.store_id = ps.store_id
WHERE p.city = 'Bangalore'
GROUP BY p.store_name
;