-- ============================================================
-- PLATFORM  : DataLemur
-- PROBLEM   : Page With No Likes
-- DIFFICULTY: Easy
-- URL       : https://datalemur.com/questions/sql-page-with-no-likes
-- DATE      : 28 May 2026
-- ============================================================
-- PROBLEM STATEMENT:
-- Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").
-- Write a query to return the IDs of the Facebook pages that have zero likes. 
-- The output should be sorted in ascending order based on the page IDs.

-- TECHNIQUE USED:
--   JOINS
--
-- TIME TAKEN: 10 minutes (solo, no hints)
--
-- MANUFACTURING PARALLEL:
--   Same pattern applies for checking for shipping tools days
-- ============================================================


SELECT
 p.page_id
FROM pages AS p
LEFT JOIN page_likes AS pl
  ON p.page_id = pl.page_id
WHERE pl.page_id IS NULL
;