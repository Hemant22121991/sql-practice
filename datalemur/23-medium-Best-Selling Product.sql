-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : Best-Selling Product
-- DIFFICULTY: medium
-- URL       : https://datalemur.com/questions/best-selling-products
-- DATE      : 15 June 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* Write an SQL query to find the best-selling product in each product category. 
     If there are two or more products with the same sales quantity, 
     go by whichever product which has the higher review rating.
	 Return the category name and product name in alphabetical order of the category.
     */

-- TECHNIQUE USED:
-- CTE, window function and filtering

-- TIME TAKEN: 15 minutes (solo, no hints)
-- ============================================================

WITH agg_table AS (
SELECT
  	category_name,
  	product_name,
  	SUM(sales_quantity) AS total_qty,
  	ROUND(AVG(rating),2) AS avg_rating
FROM product_sales AS ps
INNER JOIN products AS p
  ON ps.product_id = p.product_id
GROUP BY 1,2
ORDER BY total_qty DESC),

ranked_table AS (
SELECT 
  *,
  DENSE_RANK() 
  OVER(PARTITION BY category_name ORDER BY total_qty DESC) AS drnk_s,
  DENSE_RANK()
  OVER(PARTITION BY category_name ORDER BY avg_rating DESC) AS drnk_r
FROM agg_table)

SELECT
  category_name,
  product_name
FROM ranked_table
WHERE drnk_s = 1 AND drnk_r = 1
ORDER BY 1,2
;
