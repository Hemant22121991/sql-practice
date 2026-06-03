-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : Supercloud Customer
-- DIFFICULTY: moderate
-- URL       : https://datalemur.com/questions/supercloud-customer
-- DATE      : 03-06-2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* A Microsoft Azure Supercloud customer is defined as a customer who has 
    purchased at least one product from every product category listed in the products table.
	Write a query that identifies the customer IDs of these Supercloud customers. */

-- TECHNIQUE USED:
-- Subquery and filtering

-- TIME TAKEN: 05 minutes (solo, no hints)
-- ============================================================

SELECT
  customer_id
FROM (SELECT
  cc.customer_id,
  COUNT(DISTINCT p.product_category) AS cat_count
FROM products AS p
JOIN customer_contracts AS cc
  ON p.product_id = cc.product_id
GROUP BY 1
ORDER BY cat_count DESC) AS sub_q
WHERE cat_count = 3
;