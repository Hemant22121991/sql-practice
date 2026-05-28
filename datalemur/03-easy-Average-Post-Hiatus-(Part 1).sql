-- ============================================================
-- PLATFORM  : DataLemur
-- PROBLEM   : Average Post Hiatus (Part 1)
-- DIFFICULTY: Easy
-- URL       : https://datalemur.com/questions/sql-average-post-hiatus-1
-- DATE      : 28 May 2026
-- ============================================================
-- PROBLEM STATEMENT:
-- Given a table of Facebook posts, for each user who posted at least twice in 2021, 
-- write a query to find the number of days between each user’s first post of the year and last post of the year in the year 2021.
-- Output the user and number of the days between each user's first and last post.

-- TECHNIQUE USED:
--   Subquery
--
-- TIME TAKEN: 10 minutes (solo, no hints)
--
-- MANUFACTURING PARALLEL:
--   Same pattern applies for checking for shipping tools days
-- ============================================================


SELECT 
  user_id,
  DATEDIFF(last_post,first_post) AS days_between
FROM
  (SELECT
    user_id,
    MIN(post_date) AS first_post,
    MAX(post_date) AS last_post
  FROM posts
  WHERE
    YEAR(post_date) = 2021
  GROUP BY user_id
  ORDER BY first_post ASC) AS sb
  WHERE
    DATEDIFF(last_post,first_post) > 0
;