-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : Tweets' Rolling Averages
-- DIFFICULTY: medium
-- URL       : https://datalemur.com/questions/rolling-average-tweets
-- DATE      : 29 June 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* Given a table of tweet data over a specified time period, calculate the 3-day rolling average of tweets for each user. 
	   Output the user ID, tweet date, and rolling averages rounded to 2 decimal places.
	   Notes:
		A rolling average, also known as a moving average or running mean is a time-series technique that
        examines trends in data over a specified period of time.
		In this case, we want to determine how the tweet count for each user changes over a 3-day period.
		Effective April 7th, 2023, the problem statement, solution and hints for this question have been revised.
     */

-- TECHNIQUE USED:
-- window function and rolling average

-- TIME TAKEN: 05 minutes (solo, no hints)
-- ============================================================

SELECT
  user_id,
  tweet_date,
  ROUND(AVG(tweet_count) OVER(PARTITION BY user_id ORDER BY tweet_date
  ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) AS rolling_avg_3d
FROM tweets
;