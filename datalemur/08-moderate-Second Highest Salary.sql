-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : Second Highest Salary
-- DIFFICULTY: moderate
-- URL       : https://datalemur.com/questions/sql-second-highest-salary
-- DATE      : 31 May 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* Imagine you're an HR analyst at a tech company tasked with analyzing employee salaries. 
    Your manager is keen on understanding the pay distribution and asks you to determine the second highest salary among all employees.
	It's possible that multiple employees may share the same second highest salary. 
	In case of duplicate, display the salary only once. */

-- TECHNIQUE USED:
-- LIMIT with step skip

-- TIME TAKEN: 5 minutes (solo, no hints)
-- ============================================================

SELECT salary AS second_highest_salary
FROM employee
ORDER BY salary DESC
LIMIT 1,1
;