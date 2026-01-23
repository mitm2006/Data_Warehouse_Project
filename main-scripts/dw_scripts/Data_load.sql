''' FOR FINAL EXECUTATION:   
  EXEC bronze.load_bronze'''

  
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME
	BEGIN TRY
		SET @batch_start_time=GETDATE();
		PRINT '============================';
		PRINT 'Loading Bronze Layer';
		PRINT '============================';

		PRINT '__________________________';
		PRINT 'Loading CRM Tables';
		PRINT '__________________________';
		SET @start_time=GETDATE();
		PRINT '>>TRUNCATING TABLE: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT '>>INSERTING TABLE: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Study\Data Warehouse\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK	
		); 

		SELECT * FROM bronze.crm_cust_info;
		SET @end_time=GETDATE();
		PRINT'>>LOAD DURATION: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'Sec';
		PRINT'-----------------'
		SET @start_time=GETDATE();
		PRINT '>>TRUNCATING TABLE: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT '>>INSERTING TABLE: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Study\Data Warehouse\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		); 

		SELECT * FROM bronze.crm_prd_info;
		SET @end_time=GETDATE();
		PRINT'>>LOAD DURATION: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'Sec';
		PRINT'-----------------'
		SET @start_time=GETDATE();
		PRINT '>>TRUNCATING TABLE: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT '>>INSERTING TABLE: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Study\Data Warehouse\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		); 

		SELECT * FROM bronze.crm_sales_details;
		SET @end_time=GETDATE();
		PRINT'>>LOAD DURATION: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'Sec';
		PRINT'-----------------'

		PRINT '__________________________';
		PRINT 'Loading ERP Tables';
		PRINT '__________________________';
		SET @start_time=GETDATE();
		PRINT '>>TRUNCATING TABLE: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;
		PRINT '>>INSERTING TABLE: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Study\Data Warehouse\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		); 

		SELECT * FROM bronze.erp_cust_az12;
		SET @end_time=GETDATE();
		PRINT'>>LOAD DURATION: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'Sec';
		PRINT'-----------------'
		SET @start_time=GETDATE();
		PRINT '>>TRUNCATING TABLE: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT '>>INSERTING TABLE: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Study\Data Warehouse\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		); 

		SELECT * FROM bronze.erp_loc_a101;
		SET @end_time=GETDATE();
		PRINT'>>LOAD DURATION: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'Sec';
		PRINT'-----------------'
		SET @start_time=GETDATE();
		PRINT '>>TRUNCATING TABLE: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		PRINT '>>INSERTING TABLE: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Study\Data Warehouse\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
		); 

		SELECT * FROM bronze.erp_px_cat_g1v2;
		SET @end_time=GETDATE();
		PRINT'>>LOAD DURATION: '+ CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + 'Sec';
		SET @batch_end_time=GETDATE();
		PRINT'==========================================================='
		PRINT'>>BATCH LOAD DURATION: '+ CAST(DATEDIFF(second,@batch_start_time,@batch_end_time) AS NVARCHAR) + 'Sec';
		PRINT'==========================================================='
	END TRY
	BEGIN CATCH
		PRINT '====================================================';
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'ERROR MESSAGE'+ ERROR_MESSAGE();
		PRINT 'ERROR NUMBER'+ CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR STATE'+ CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '====================================================';
	END CATCH
END
