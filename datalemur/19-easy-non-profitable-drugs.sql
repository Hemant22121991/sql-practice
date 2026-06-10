-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : Pharmacy Analytics (Part 2)
-- DIFFICULTY: easy
-- URL       : https://datalemur.com/questions/non-profitable-drugs
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
-- CTE and filtering

-- TIME TAKEN: 05 minutes (solo, no hints)
-- ============================================================

WITH losses_table AS (SELECT 
*,
total_sales - cogs AS losses
FROM pharmacy_sales
WHERE (total_sales - cogs) < 0)

SELECT
manufacturer,
COUNt(drug) AS drug_count,
SUM(ABS(losses)) AS total_loss
FROM losses_table
GROUP BY 1
ORDER BY total_loss DESC
;
