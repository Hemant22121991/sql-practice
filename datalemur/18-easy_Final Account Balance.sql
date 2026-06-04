-- ============================================================
-- PLATFORM  : Datalemur
-- PROBLEM   : Final Account Balance
-- DIFFICULTY: easy
-- URL       : https://datalemur.com/questions/final-account-balance
-- DATE      : 04 June 2026
-- ============================================================
-- PROBLEM STATEMENT:

	/* Given a table containing information about bank deposits and withdrawals made using Paypal, 
	   write a query to retrieve the final account balance for each account, 
       taking into account all the transactions recorded in the table with the assumption that there are no missing transactions. */

-- TECHNIQUE USED:
-- column_pivoting_and aggregation

-- TIME TAKEN: 03 minutes (solo, no hints)
-- ============================================================

SELECT 
account_id,
SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE 0 END) -
SUM(CASE WHEN transaction_type = 'Withdrawal' THEN amount ELSE 0 END) AS final_balance

FROM transactions
GROUP BY 1
;