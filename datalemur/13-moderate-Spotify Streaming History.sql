-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : Spotify Streaming History
-- DIFFICULTY: moderate
-- URL       : https://datalemur.com/questions/spotify-streaming-history
-- DATE      : 03-06-2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* You're given two tables containing data on Spotify users' streaming activity: 
    songs_history which has historical streaming data, and songs_weekly which has data from the current week.
	Write a query that outputs the user ID, song ID, and cumulative count of song plays up to August 4th, 2022, sorted in descending order.
	Assume that there may be new users or songs in the songs_weekly table that are not present in the songs_history table.
	Definitions:
	song_weeklytable only contains data for the week of August 1st to August 7th, 2022.
	songs_history table contains data up to July 31st, 2022. The query should include historical data from this table. */

-- TECHNIQUE USED:
-- CTE, UNION and filtering

-- TIME TAKEN: 20 minutes (solo, no hints)
-- ============================================================

WITH combine AS (SELECT
  user_id,
  song_id,
  COUNT(*) AS song_plays
FROM songs_weekly 
WHERE listen_time <= '2022-08-04 23:59:59'
GROUP BY 1,2

UNION ALL

SELECT
  user_id,
  song_id,
  song_plays
FROM songs_history
ORDER BY song_plays DESC)

SELECT
  user_id,
  song_id,
  SUM(song_plays) AS song_count
FROM combine
GROUP BY 1,2
;