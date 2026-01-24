---Generate a Report that shows all key metrices of the business
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL 
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL 
SELECT 'Total no. Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL 
SELECT 'Total no. Products', COUNT(DISTINCT product_name) FROM gold.dim_products
UNION ALL 
SELECT 'Total no. Customers', COUNT(customer_id) FROM gold.dim_customers


