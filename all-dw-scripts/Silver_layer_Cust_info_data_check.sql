---Check For NULL or Duplications
SELECT cst_id,COUNT(*) 
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL

---Checks for Unwanted Spaces
---Expectation: No Results
SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

---Data Consistancy
SELECT DISTINCT cst_gndr
FROM silver.crm_cust_info

---Final Data
SELECT * FROM silver.crm_cust_info
