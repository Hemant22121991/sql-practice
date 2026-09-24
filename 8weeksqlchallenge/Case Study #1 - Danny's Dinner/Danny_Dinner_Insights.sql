-- What is the total amount each customer spent at the restaurent?

SELECT
	customer_id,
	SUM(price) AS total_amount
FROM sales s
JOIN menu m
	ON s.product_id = m.product_id
GROUP BY 1
;

-- How many days has each customer visited the restaurent?

SELECT
	customer_id,
	COUNT(DISTINCT order_date) AS total_days
FROM sales
GROUP BY 1
;

-- What was the first item from the menu purchased by each customer?

SELECT
	customer_id,
    order_date,
    product_name
FROM (
SELECT
	customer_id,
    s.product_id,
    order_date,
    product_name,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date, s.product_id) AS rn
FROM sales s
JOIN menu m
	ON s.product_id = m.product_id) AS filtering_query
WHERE rn = 1
;

-- What is the most purchased item on the menu and how many times was it purchased
-- by all customers?

WITH agg_table AS (
SELECT
	s.product_id,
    customer_id,
    product_name,
	COUNT(s.product_id) AS total_count
FROM sales s
JOIN menu m
	ON s.product_id = m.product_id
GROUP BY 1,2,3)

SELECT 
	*,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY total_count DESC) AS rn
FROM agg_table
ORDER BY rn
;
