-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : Patient Support Analysis (Part 1)
-- DIFFICULTY: easy
-- URL       : https://datalemur.com/questions/frequent-callers
-- DATE      : 11 June 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* UnitedHealth Group (UHG) has a program called Advocate4Me, which allows policy holders 
    (or, members) to call an advocate and receive support for their health care needs – 
    whether that's claims and benefits support, drug coverage, pre- and post-authorisation, medical records, 
    emergency assistance, or member portal services.
	Write a query to find how many UHG policy holders made three, 
    or more calls, assuming each call is identified by the case_id column.
     */

-- TECHNIQUE USED:
-- subquery & filtering

-- TIME TAKEN: 05 minutes (solo, no hints)
-- ============================================================

SELECT
  COUNT(policy_holder_id) AS policy_holder_count
FROM (
SELECT
  policy_holder_id,
  COUNT(case_id) AS total_calls
FROM callers
GROUP BY 1) AS t
WHERE total_calls >= 3
;