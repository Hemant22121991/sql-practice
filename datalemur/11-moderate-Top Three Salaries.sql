-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : Top Three Salaries
-- DIFFICULTY: moderate
-- URL       : https://datalemur.com/questions/sql-top-three-salaries
-- DATE      : 02-06-2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* As part of an ongoing analysis of salary distribution within the company, your manager has requested a report identifying high earners in each department. 
    A 'high earner' within a department is defined as an employee with a salary ranking among the top three salaries within that department.
	You're tasked with identifying these high earners across all departments. 
    Write a query to display the employee's name along with their department name and salary. 
    In case of duplicates, sort the results of department name in ascending order, then by salary in descending order.
    If multiple employees have the same salary, then order them alphabetically.
	Note: Ensure to utilize the appropriate ranking window function to handle duplicate salaries effectively. */

-- TECHNIQUE USED:
-- CTE and window function

-- TIME TAKEN: 10 minutes (solo, no hints)
-- ============================================================

-- step-01 Find out high earner in each deparment by salary ranking in each department
-- step-02 In case of duplicates sort result by department NAME
-- step-03 if multiple employee have the same salary, then order them alphabetically

WITH ranked_salary AS (SELECT
  department_name,
  name,
  salary,
  DENSE_RANK() OVER(PARTITION BY e.department_id ORDER BY salary DESC) AS rn
FROM employee AS e
JOIN department AS d
  ON e.department_id = d.department_id)
  
SELECT
  department_name,
  name,
  salary
FROM ranked_salary
WHERE rn <=3
ORDER BY department_name, name
;