---Sales by Product Category
SELECT
	category,
	SUM(sales_amount) AS total_sales,
	SUM(quantity) AS total_quantity
FROM gold.vw_sales_analytics
GROUP BY category
ORDER BY total_sales DESC;

---Sales by Country
SELECT
    country,
    SUM(sales_amount) AS total_sales
FROM gold.vw_sales_analytics
GROUP BY country
ORDER BY total_sales DESC;


---Customer Age vs Sales
SELECT
	CASE
		WHEN customer_age < 30 THEN 'UNDER 30'
		WHEN customer_age BETWEEN 30 AND 45 THEN '30-45'
		WHEN customer_age BETWEEN 46 AND 60 THEN '46-60'
		ELSE 'Above 60'
	END AS age_group,
	SUM(sales_amount) AS total_sales
FROM gold.vw_sales_analytics
GROUP BY
	CASE
		WHEN customer_age < 30 THEN 'UNDER 30'
		WHEN customer_age BETWEEN 30 AND 45 THEN '30-45'
		WHEN customer_age BETWEEN 46 AND 60 THEN '46-60'
		ELSE 'Above 60'
	END;

---Shipping Delay Risk
SELECT
	AVG(shipping_days) AS avg_shipping_days,
	MAX(shipping_days) AS max_shipping_days
FROM gold.vw_sales_analytics;
