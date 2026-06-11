-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : FAANG Stock Min-Max (Part 1)
-- DIFFICULTY: medium
-- URL       : https://datalemur.com/questions/sql-bloomberg-stock-min-max-1
-- DATE      : 11 June 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* The Bloomberg terminal is the go-to resource for financial professionals, offering convenient access to a wide array of financial datasets. 
    As a Data Analyst at Bloomberg, you have access to historical data on stock performance.
	Currently, you're analyzing the highest and lowest open prices for each FAANG stock by month over the years.
	For each FAANG stock, display the ticker symbol, the month and year ('Mon-YYYY') with the corresponding highest 
    and lowest open prices (refer to the Example Output format). Ensure that the results are sorted by ticker symbol.
     */

-- TECHNIQUE USED:
--  CTE, Window function & filtering

-- TIME TAKEN: 15 minutes (solo, no hints)
-- ============================================================

WITH ranked AS (
    SELECT
        ticker,
        TO_CHAR(date,'Mon-YYYY') AS month_year,
        open,
        ROW_NUMBER() OVER (
            PARTITION BY ticker
            ORDER BY open DESC
        ) AS highest_rn,
        ROW_NUMBER() OVER (
            PARTITION BY ticker
            ORDER BY open ASC
        ) AS lowest_rn
    FROM stock_prices
)

SELECT
    ticker,
    MAX(CASE WHEN highest_rn = 1 THEN month_year END) AS highest_mth,
    MAX(CASE WHEN highest_rn = 1 THEN open END) AS highest_open,
    MAX(CASE WHEN lowest_rn = 1 THEN month_year END) AS lowest_mth,
    MAX(CASE WHEN lowest_rn = 1 THEN open END) AS lowest_open
FROM ranked
GROUP BY ticker
ORDER BY ticker;
