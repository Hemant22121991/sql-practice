-- ============================================================
-- PLATFORM  : Analyst Builder
-- PROBLEM   : Carcinogens
-- DIFFICULTY: moderate
-- URL       : https://www.analystbuilder.com/questions/carcinogens-UPLkt
-- DATE      : 28 May 2026
-- ============================================================
-- PROBLEM STATEMENT:

-- There's healthy food and then there's food that we are eating.
-- Let's identify which of these products contain carcinogens (cancer causing substances).
-- Write a query to list all products that contain at least two carcinogenic ingredients.
-- The output should have just the Product_Name sorted alphabetically

-- TECHNIQUE USED:
-- table join and CTE
--
-- TIME TAKEN: 10 minutes (solo, no hints)

-- MANUFACTURING PARALLEL:
--   Same pattern applies for finding machine failure event count
-- ============================================================

-- STEP 01: Join product and ingredient tables
-- STEP 02: create a new column in this with count of unsafe ingredient product wise
-- STEP 03: convert this into a CTE
-- STEP 04: call the CTE with filter where unsafe ingredient is more than one in a product

WITH unsafe_product AS (
SELECT
  p.product_id,
  p.product_name,
  COUNT(CASE WHEN i.is_carcinogenic = 'Yes' THEN 1 ELSE NULL END) AS ing_count
FROM products AS p
JOIN ingredients AS i
  ON p.product_id = i.product_id
GROUP BY p.product_id, p.product_name
ORDER BY p.product_id
)
SELECT product_name
FROM unsafe_product
WHERE ing_count > 1
ORDER BY product_name ASC
;
