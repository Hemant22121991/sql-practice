-- ============================================================
-- PLATFORM  : codebasics
-- PROBLEM   : Sorting Unique Product Counts by Segment at Atliq Exclusive
-- DIFFICULTY: easy
-- URL       : https://codebasics.io/bootcamp-practice-arenas/1/question/11
-- DATE      : 30 May 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* Imagine you are a data analyst at Atliq Exclusive. 
    You are tasked with identifying the unique product counts for each segment and sorting them in descending order of product counts.
	Assumptions:
	The `segment` field in the dataset is correctly labeled and accurately represents the different segments.
    The `product_id` field is unique to each product and does not contain duplicates.
    The `dim_product` is current and includes all products up to the present date */

-- TECHNIQUE USED:
-- filter

-- TIME TAKEN: 5 minutes (solo, no hints)

-- ============================================================

SELECT 
    segment,
    COUNT(DISTINCT product_code) AS product_code
FROM dim_product
GROUP BY 1
ORDER BY product_code DESC
;