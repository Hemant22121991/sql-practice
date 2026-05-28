-- ============================================================
-- PLATFORM  : DataLemur
-- PROBLEM   : Laptop vs. Mobile Viewership
-- DIFFICULTY: Easy
-- URL       : https://datalemur.com/questions/laptop-mobile-viewership
-- DATE      : 28 May 2026
-- ============================================================
-- PROBLEM STATEMENT:
-- Assume you're given the table on user viewership categorised by device type where the three types are laptop, tablet, and phone.
-- Write a query that calculates the total viewership for laptops and mobile devices where mobile is defined as the sum of tablet and phone viewership.
-- Output the total viewership for laptops as laptop_reviews and the total viewership for mobile devices as mobile_views.
-- Effective 15 April 2023, the solution has been updated with a more concise and easy-to-understand approach.

-- TECHNIQUE USED:
--   Column Pivoting

-- TIME TAKEN: 5 minutes (solo, no hints)
--
-- MANUFACTURING PARALLEL:
--   Same pattern applies for categorising machines
-- ============================================================

SELECT
  SUM(CASE WHEN device_type = "laptop" THEN 1 ELSE 0 END) AS laptop_views,
  SUM(CASE WHEN device_type IN("tablet","phone") THEN 1 ELSE 0 END) AS mobile_views
FROM viewership
;