---Cumulative analysis
SELECT
order_date,
total_sales,
SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales
FROM
(
    SELECT 
        DATEADD(year, DATEDIFF(year, 0, order_date), 0) AS order_date,
        SUM(sales_amount) AS total_sales
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATEADD(year, DATEDIFF(year, 0, order_date), 0)
)t


