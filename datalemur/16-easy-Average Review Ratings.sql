-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : Average Review Ratings
-- DIFFICULTY: easy
-- URL       : https://datalemur.com/questions/sql-avg-review-ratings
-- DATE      : 04 June 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* by month. The output should display the month as a numerical value, product ID, 
    and average star rating rounded to two decimal places. 
    Sort the output first by month and then by product ID. */

-- TECHNIQUE USED:
-- time function and aggregation

-- TIME TAKEN: 5 minutes (solo, no hints)
-- ============================================================

SELECT
  EXTRACT(MONTH FROM submit_date) AS mth,
  product_id AS product,
  ROUND(AVG(stars),2) AS avg_stars
FROM reviews
GROUP BY 1,2
ORDER BY 1,2
;