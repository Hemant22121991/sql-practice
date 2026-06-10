-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : Pharmacy Analytics (Part 3)
-- DIFFICULTY: easy
-- URL       : https://datalemur.com/questions/total-drugs-sales
-- DATE      : 10 June 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* CVS Health is analyzing its pharmacy sales data, and how well different products are selling in the market. 
	Each drug is exclusively manufactured by a single manufacturer.
	Write a query to identify the manufacturers associated with the drugs that resulted in losses 
    for CVS Health and calculate the total amount of losses incurred.
    Output the manufacturer's name, the number of drugs associated with losses, 
    and the total losses in absolute value. Display the results sorted in descending order with 
    the highest losses displayed at the top.
     */

-- TECHNIQUE USED:
-- subquery, aggregation & string formatting

-- TIME TAKEN: 05 minutes (solo, no hints)
-- ============================================================

SELECT
  manufacturer,
  CONCAT("$",total_sales," million") AS sales_mil
FROM (
SELECT 
manufacturer,
ROUND(SUM(total_sales)/1000000) AS total_sales
FROM pharmacy_sales
GROUP BY 1
ORDER BY total_sales DESC, manufacturer DESC) AS ts
;
