-- ============================================================
-- PLATFORM  : Analyst Builder
-- PROBLEM   : Brawndo Breakdown
-- DIFFICULTY: Easy
-- URL       : https://www.analystbuilder.com/questions/brawndo-breakdown-QmHwz
-- DATE      : 25 May 2026
-- ============================================================
-- PROBLEM STATEMENT:

-- A beverage company called Brando stores its sports drink concentrate in multiple warehouses.
-- Each warehouse keeps track of the color of the concentrate and the number of gallons currently in storage.
-- The company wants a quick summary of how much concentrate they have for each color across all warehouses combined. 
-- This will help the supply team understand which flavors are most stocked and plan future production.
-- You are given the table brawndo_inventory, which contains the following columns:

-- warehouse_id – the unique ID of the warehouse
-- color – the color of the concentrate
-- gallons – the number of gallons stored at that warehouse
-- Calculate the amount of gallons for each color and order the output in alphabetical order.

-- TECHNIQUE USED:
-- simple GROUP BY and ORDER BY

-- TIME TAKEN: 2 minutes (solo, no hints)

-- MANUFACTURING PARALLEL:
--   Same pattern applies for inventory analysis
-- ============================================================

SELECT
  color,
  SUM(gallons) AS gallons
FROM brawndo_inventory
GROUP BY color
ORDER BY color
;