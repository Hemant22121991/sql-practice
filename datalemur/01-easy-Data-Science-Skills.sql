-- ============================================================
-- PLATFORM  : DataLemur
-- PROBLEM   : Data Science SKills
-- DIFFICULTY: Easy
-- URL       : https://datalemur.com/questions/matching-skills
-- DATE      : 28 May 2026
-- ============================================================
-- PROBLEM STATEMENT:
-- Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. 
-- You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.
-- Write a query to list the candidates who possess all of the required skills for the job. 
-- Sort the output by candidate ID in ascending order.

-- TECHNIQUE USED:
--   GROUP BY + HAVING
--
-- TIME TAKEN: 5 minutes (solo, no hints)
--
-- MANUFACTURING PARALLEL:
--   Same pattern applies to finiding suppliers having specific machines
-- ============================================================

SELECT
    candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) = 3;
;
