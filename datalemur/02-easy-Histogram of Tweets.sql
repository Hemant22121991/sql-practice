-- ============================================================
-- PLATFORM  : DataLemur
-- PROBLEM   : Histogram of Tweets
-- DIFFICULTY: Easy
-- URL       : https://datalemur.com/questions/sql-histogram-tweets
-- DATE      : 28 May 2026
-- ============================================================
-- PROBLEM STATEMENT:
-- Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022.
-- Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.
-- In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.

-- TECHNIQUE USED:
--   Subquery
--
-- TIME TAKEN: 8 minutes (solo, no hints)
--
-- MANUFACTURING PARALLEL:
--   Same pattern applies for bucketing manufacturing items
-- ============================================================


SELECT
  tweet_bucket,
  COUNT(users_num) AS users_num
FROM (
  SELECT 
    user_id,
    COUNT(tweet_id) AS tweet_bucket,
    COUNT(user_id) AS users_num
  FROM tweets
  WHERE YEAR(tweet_date) = 2022
  GROUP BY 1
  ORDER BY user_id ASC) AS subq
GROUP BY tweet_bucket
ORDER BY tweet_bucket ASC
;