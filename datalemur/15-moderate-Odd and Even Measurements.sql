-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : Odd and Even Measurements
-- DIFFICULTY: moderate
-- URL       : https://datalemur.com/questions/odd-even-measurements
-- DATE      : 03-06-2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* Assume you're given a table with measurement values obtained from a Google sensor over multiple days with measurements taken multiple times within each day.
	Write a query to calculate the sum of odd-numbered and even-numbered measurements separately for a particular day and display the results in two different columns.
    Refer to the Example Output below for the desired format.
	Definition:
	Within a day, measurements taken at 1st, 3rd, and 5th times are considered odd-numbered measurements, 
    and measurements taken at 2nd, 4th, and 6th times are considered even-numbered measurements. */

-- TECHNIQUE USED:
-- CTE, Type casting and column pivoting

-- TIME TAKEN: 18 minutes (solo, no hints)
-- ============================================================

WITH ranked_time AS (SELECT 
CAST(measurement_time AS DATE) AS measurement_day,
measurement_value,
ROW_NUMBER() OVER(PARTITION BY CAST(measurement_time AS DATE)
  ORDER BY measurement_time) AS rn
FROM measurements)

SELECT
  measurement_day,
  SUM(CASE WHEN rn in (1,3,5) THEN measurement_value ELSE 0 END) AS odd_sum,
  SUM(CASE WHEN rn in (2,4,6) THEN measurement_value ELSE 0 END) AS even_sum
FROM ranked_time
GROUP BY 1
ORDER BY 1
;