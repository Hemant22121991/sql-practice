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

WITH top_product AS (
SELECT
	product_id,
	COUNT(product_id) AS total_orders
FROM sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1)

SELECT
	customer_id,
    product_name,
    COUNT(s.product_id) AS total_ordered_times
FROM sales s
JOIN top_product AS tp
	ON s.product_id = tp.product_id
JOIN menu m
	ON s.product_id = m.product_id
GROUP BY 1,2
;

-- Which item wa the most popular for each customer?

-- Ramen, as answered in above query

-- Which item was purchased first by the customer after they became a member?

SELECT
	customer_id,
    order_date,
    product_id,
    product_name,
    join_date
FROM (
SELECT 
	s.customer_id,
    order_date,
    s.product_id,
    product_name,
    join_date,
    row_number() OVER(PARTITION BY s.customer_id ORDER BY order_date) AS rn
FROM sales s
JOIN members m
	ON s.customer_id = m.customer_id
JOIN menu u
	ON s.product_id = u.product_id
WHERE order_date > join_date
ORDER BY order_date) AS filtering_subquery
WHERE rn = 1
;

-- Which item was purchased just before the customer became a member?

SELECT
	customer_id,
    order_date,
    product_id,
    product_name,
    join_date
FROM (
SELECT 
	s.customer_id,
    order_date,
    s.product_id,
    product_name,
    join_date,
    row_number() OVER(PARTITION BY s.customer_id ORDER BY order_date) AS rn
FROM sales s
JOIN members m
	ON s.customer_id = m.customer_id
JOIN menu u
	ON s.product_id = u.product_id
WHERE order_date < join_date
ORDER BY order_date) AS filtering_subquery
WHERE rn = 1
;

-- What is the total items and amount spent for each member before they became a member?

SELECT
	mm.customer_id,
    SUM(price) AS total_amount
FROM sales s
JOIN menu m
	ON s.product_id = m.product_id
JOIN members mm
	ON s.customer_id = mm.customer_id
WHERE order_date > join_date
GROUP BY 1
ORDER BY s.customer_id
;

-- If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

