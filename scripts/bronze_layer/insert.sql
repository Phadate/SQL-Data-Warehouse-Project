/*
================================================================

Stored Procedure: Load Bronze Layer (source -> Bronze)

================================================================

Script purpose:
    This Stores procedure loads sata into the 'bronze' schema from external csv files.
    It performs the following actions:
    Truncate the bronze tables before loading data.
    Uses the "BULK INSERT" command to load data from csv files to bronze tables

Parameters:
    None.
   This stored procedure doesn't accept any parameters or return any values


Usage Example:
    EXEC bronze.load_bronze;

*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    DECLARE @start_time DATETIME, @end_date DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;

    BEGIN TRY
        PRINT '==========================================================='
        PRINT 'Loading Bronze Layer'
        PRINT '==========================================================='

        PRINT '___________________________________________________________'
        PRINT 'Loading CRM Tables';
        PRINT '___________________________________________________________'
        SET @batch_start_time = GETDATE()
        SET @start_time = GETDATE()
        PRINT '>> Truncating Table: bronze.crm_cust_info'
        TRUNCATE TABLE bronze.crm_cust_info -- Make the table empty

        PRINT '>> Inserting Data Into: bronze.crm_cust_info'
        BULK INSERT bronze.crm_cust_info -- used for bulk insert
        FROM 'C:\Users\USER\Documents\Github\SQL-Data-Warehouse-Project\datasets\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_date = GETDATE();
        PRINT '>> Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_date) AS NVARCHAR) + ' seconds';
        PRINT '____________________'


        --  CRM PRD INFO
        SET @start_time = GETDATE()
        PRINT '>> Truncating Table: bronze.crm_prd_info'
        TRUNCATE TABLE bronze.crm_prd_info

        PRINT '>> Inserting Data Into: bronze.crm_prd_info'
        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\USER\Documents\Github\SQL-Data-Warehouse-Project\datasets\source_crm\prd_info.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR =',',
            TABLOCK
        );
        SET @end_date = GETDATE();
        PRINT '>> Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_date) AS NVARCHAR) + ' seconds';
        PRINT '____________________'


        --  CRM Sales details
        SET @start_time = GETDATE()
        PRINT '>> Truncating Table: bronze.crm_sales_details'
        TRUNCATE TABLE bronze.crm_sales_details

        PRINT '>> Inserting Data Into: bronze.crm_sales_details'
        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\USER\Documents\Github\SQL-Data-Warehouse-Project\datasets\source_crm\sales_details.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
        SET @end_date = GETDATE();
        PRINT '>> Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_date) AS NVARCHAR) + ' seconds';
        PRINT '____________________'

        PRINT '___________________________________________________________'
        PRINT 'Loading ERP Tables';
        PRINT '___________________________________________________________'


        -- ERP
        SET @start_time = GETDATE()
        PRINT '>> Truncating Table: bronze.erp_cust_az12'
        TRUNCATE TABLE bronze.erp_cust_az12

        PRINT '>> Inserting Data Into: bronze.erp_cust_az12'
        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\USER\Documents\Github\SQL-Data-Warehouse-Project\datasets\source_erp\cust_az12.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR =',',
            TABLOCK
        );
        SET @end_date = GETDATE();
        PRINT '>> Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_date) AS NVARCHAR) + ' seconds';
        PRINT '____________________'
        
        -- ERP loc a101
        SET @start_time = GETDATE()
        PRINT '>> Truncating Table: bronze.erp_loc_a101'
        TRUNCATE TABLE bronze.erp_loc_a101

        PRINT '>> Inserting Data Into: bronze.erp_loc_a101'
        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\USER\Documents\Github\SQL-Data-Warehouse-Project\datasets\source_erp\loc_a101.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR =',',
            TABLOCK
        );
        SET @end_date = GETDATE();
        PRINT '>> Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_date) AS NVARCHAR) + ' seconds';
        PRINT '____________________'
        
        -- ERP cat g1v2
        SET @start_time = GETDATE()
        PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2'
        TRUNCATE TABLE bronze.erp_px_cat_g1v2

        PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2'
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\USER\Documents\Github\SQL-Data-Warehouse-Project\datasets\source_erp\px_cat_g1v2.csv'
        WITH(
            FIRSTROW = 2,
            FIELDTERMINATOR =',',
            TABLOCK
        );
        SET @end_date = GETDATE();
        PRINT '>> Load Duration:' + CAST(DATEDIFF(second, @start_time, @end_date) AS NVARCHAR) + ' seconds';
        PRINT '____________________'

        SET @batch_end_time = GETDATE();
        PRINT 'Loading Bronze is completed'
        PRINT '>> Total Load Duration:' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
        PRINT '____________________'

    END TRY
    BEGIN CATCH
        PRINT '============================================================='
        PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
        PRINT 'Error Message' + ERROR_MESSAGE();
        PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
    END CATCH
END;


EXEC bronze.load_bronze;
