---Yearly trend analysis
SELECT 
YEAR(order_date) AS order_years,
SUM(sales_amount) as total_sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)	
ORDER BY YEAR(order_date)


---Seasonal trend analysis
SELECT 
MONTH(order_date) AS order_months,
SUM(sales_amount) as total_sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY MONTH(order_date)	
ORDER BY MONTH(order_date)

---Over time Trend analysis
SELECT 
YEAR(order_date) AS order_years,
MONTH(order_date) AS order_months,
SUM(sales_amount) as total_sales,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), 	MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date)
