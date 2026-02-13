CREATE VIEW gold.vw_sales_analytics AS
SELECT
	f.order_number,
	f.order_date,
	f.ship_date,
	f.due_date,

	DATEDIFF(day, f.order_date, f.ship_date) AS shipping_days,
	DATEDIFF(day, f.order_date, f.due_date) AS promised_days,

	f.quantity,
	f.price,
	f.sales_amount,

	c.customer_key,
	c.first_name,
	c.last_name,
	c.country,
	c.gender,
	c.marital_status,
	DATEDIFF(year,c.birthdates, GETDATE()) AS customer_age

FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
	ON f.product_key=p.product_key
LEFT JOIN gold.dim_customers c
	ON f.customer_key=c.customer_key;
