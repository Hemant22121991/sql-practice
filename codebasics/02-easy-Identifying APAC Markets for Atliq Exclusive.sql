-- ============================================================
-- PLATFORM  : codebasics
-- PROBLEM   : Identifying APAC Markets for Atliq Exclusive
-- DIFFICULTY: easy
-- URL       : https://codebasics.io/bootcamp-practice-arenas/1/question/9
-- DATE      : 30 May 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* Imagine you are a data analyst at Atliq Exclusive. 
    You are tasked with identifying all the markets in the APAC region where the company operates. 
    This information will be used to tailor marketing strategies and evaluate market penetration.
	Assumptions:
	The `dim_customer` table is up-to-date and accurately reflects current operations.
    The customer name "Atliq Exclusive" is consistent without any variations in spelling. */

-- TECHNIQUE USED:
-- filter
--
-- TIME TAKEN: 5 minutes (solo, no hints)

-- MANUFACTURING PARALLEL:
--   Same pattern applies for finding distinct customers in region
-- ============================================================


SELECT DISTINCT market
FROM dim_customer
WHERE
    customer = 'Atliq Exclusive' AND
    region = 'APAC'
ORDER BY market
;