-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : Well Paid Employees
-- DIFFICULTY: easy
-- URL       : https://datalemur.com/questions/sql-well-paid-employees
-- DATE      : 04 June 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* Companies often perform salary analyses to ensure fair compensation practices.
    One useful analysis is to check if there are any employees earning more than their direct managers.
	As a HR Analyst, you're asked to identify all employees who earn more than their direct managers.
	The result should include the employee's ID and name. */

-- TECHNIQUE USED:
-- self join

-- TIME TAKEN: 15 minutes (solo, no hints)
-- ============================================================

SELECT
  e.employee_id,
  e.name
FROM employee AS m
JOIN employee AS e
  ON m.employee_id = e.manager_id
WHERE m.salary < e.salary  
ORDER BY m.employee_id
;