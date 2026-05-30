-- ============================================================
-- PLATFORM  : codebasics
-- PROBLEM   : Optimizing Costs: High and Low Manufacturing Costs at Atliq Exclusive
-- DIFFICULTY: moderate
-- URL       : https://codebasics.io/bootcamp-practice-arenas/1/question/13
-- DATE      : 30 May 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* Imagine you are a data analyst at Atliq Exclusive. 
    Your task is to identify the products with the highest and lowest manufacturing costs. 
    This information is crucial for optimizing cost-efficiency and pricing strategies across the product line.
	Assumptions:
	The dataset includes a `fact_manufacturing_cost` table that accurately records manufacturing costs for each product. 
    Each `product_id` is unique and devoid of duplicates. 
    The `dim_product` table is up-to-date, encompassing all products currently offered by Atliq Exclusive. */

-- TECHNIQUE USED:
-- subquery and union
--
-- TIME TAKEN: 15 minutes (solo, no hints)

-- ============================================================

SELECT
    p.product,
    p.product_code,
    pp.manufacturing_cost
FROM dim_product AS p
JOIN (
(SELECT
    product_code,
    MAX(manufacturing_cost) AS manufacturing_cost
FROM fact_manufacturing_cost
GROUP BY 1
ORDER BY manufacturing_cost DESC
LIMIT 1)
UNION ALL
(SELECT
    product_code,
    MIN(manufacturing_cost) AS manufacturing_cost
FROM fact_manufacturing_cost
GROUP BY 1
ORDER BY manufacturing_cost ASC
LIMIT 1)) AS pp
    ON p.product_code = pp.product_code
ORDER BY manufacturing_cost DESC
;