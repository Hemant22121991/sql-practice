-- ============================================================
-- PLATFORM  : Analyst Builder
-- PROBLEM   : Salary Smackdown
-- DIFFICULTY: Easy
-- URL       : https://www.analystbuilder.com/questions/salary-smackdown-URbDj
-- DATE      : 25 May 2026
-- ============================================================
-- PROBLEM STATEMENT:

-- Marcos is looking to recruit new data engineers for his company, OlderSiblingData, which collaborates with governments globally to enhance the quality of life through insightful data analytics.
-- He is considering several international markets for hiring, and he wants to determine which countries offer the most cost-effective salaries for data engineers. 
-- To do this, Marcos needs to rank the countries by their average data engineer salary, so he can make the most budget-friendly choice.
-- Return the country name and average engineer salary for the top 5 countries, ordered from the cheapest to the most expensive.

-- TECHNIQUE USED:
-- simple ORDER BY and limit
--
-- TIME TAKEN: 1 minutes (solo, no hints)
--
-- MANUFACTURING PARALLEL:
--   Same pattern applies for supplier cost analysis
-- ============================================================

SELECT *
FROM data_engineer_salaries
ORDER BY salary ASC
LIMIT 5;