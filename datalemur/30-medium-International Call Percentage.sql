-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : International Call Percentage
-- DIFFICULTY: medium
-- URL       : https://datalemur.com/questions/international-call-percentage
-- DATE      : 01 Jul 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* 
		A phone call is considered an international call when the person calling 
        is in a different country than the person receiving the call.
		What percentage of phone calls are international? Round the result to 1 decimal.
		Assumption:
		The caller_id in phone_info table refers to both the caller and receiver.
     */

-- TECHNIQUE USED:
-- CTE and filtering

-- TIME TAKEN: 10 minutes (no hint)
-- ============================================================

WITH caller_country AS (
SELECT
  DISTINCT pc.caller_id,
  pii.country_id AS caller_Country
FROM phone_calls AS pc
JOIN phone_info AS pii
  ON pc.caller_id = pii.caller_id),

receiver_country AS (
SELECT
  DISTINCT pc.receiver_id,
  pii.country_id AS receiver_country
FROM phone_calls AS pc
JOIN phone_info AS pii
  ON pc.receiver_id = pii.caller_id)

SELECT
  ROUND(
  100.0 * SUM(CASE WHEN caller_country !=	receiver_country THEN 1 ELSE 0 END)
  /COUNT(*),1) AS international_calls_pct
FROM phone_calls AS pc
JOIN caller_country AS cc
  ON pc.caller_id = cc.caller_id
JOIN receiver_country AS rc
  ON pc.receiver_id = rc.receiver_id
;