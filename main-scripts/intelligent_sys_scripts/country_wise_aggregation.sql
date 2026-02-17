SELECT
    country,
    YEAR(order_date)  AS sales_year,
    MONTH(order_date) AS sales_month,
    SUM(sales_amount) AS monthly_sales
FROM gold.vw_sales_analytics
WHERE country IS NOT NULL
  AND order_date IS NOT NULL
GROUP BY
    country,
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    country,
    sales_year,
    sales_month;
