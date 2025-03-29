
-- Create a new table called 'crm_cust_info' in schema 'bronze'
-- Drop the table if it already exists
IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
DROP TABLE bronze.crm_cust_info
GO
-- Create the table in the specified schema
CREATE TABLE bronze.crm_cust_info
(
-- cst_id,cst_key,cst_firstname,
-- cst_lastname,cst_marital_status,cst_gndr,cst_create_date
    cst_id INT NOT NULL PRIMARY KEY, -- primary key column
    cst_key [NVARCHAR](50),
    cst_firstname [NVARCHAR](50),
    cst_lastname [NVARCHAR](50),
    cst_marital_status [NVARCHAR](50),
    cst_gndr [NVARCHAR](50),
    cst_create_date [DATE]
);
GO


-- Create a new table called 'crm_prd_info' in schema 'bronze'
-- Drop the table if it already exists
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
DROP TABLE bronze.crm_prd_info
GO
-- Create the table in the specified schema
CREATE TABLE bronze.crm_prd_info
(
-- prd_id,prd_key,prd_nm,prd_cost,
-- prd_line,prd_start_dt,prd_end_dt
    prd_id_id INT NOT NULL PRIMARY KEY, -- primary key column
    prd_key [NVARCHAR](50),
    prd_num [NVARCHAR](50),
    prd_cost [INT],
    prd_line [NVARCHAR](10),
    prd_start_dt [DATE],
    prd_end_dt [DATE]
);
GO

-- Create a new table called 'crm_sales_details' in schema 'bronze'
-- Drop the table if it already exists
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
DROP TABLE bronze.crm_sales_details
GO
-- Create the table in the specified schema
CREATE TABLE bronze.crm_sales_details
(
/* sls_ord_num,sls_prd_key,sls_cust_id,sls_order_dt,
sls_ship_dt,sls_due_dt,sls_sales,sls_quantity,sls_price
*/
    sls_ord_num[NVARCHAR](50), -- primary key column
    sls_prd_key [NVARCHAR](50),
    sls_cust_id [INT],
    sls_order_dt [INT],
    sls_ship_dt [INT],
    sls_due_dt [INT],
    sls_sales [INT],
    sls_quantity [INT],
    sls_price [INT]
);
GO


-- SOURCE_ERP
-- Create a new table called 'erp_cust_az12' in schema 'bronze'
-- Drop the table if it already exists
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
DROP TABLE bronze.erp_cust_az12
GO
-- Create the table in the specified schema
CREATE TABLE bronze.erp_cust_az12
(
-- CID,BDATE,GEN
    CID [NVARCHAR] (30), -- primary key column
    BDATE [DATE],
    GEN [NVARCHAR](10)
);
GO


-- Create a new table called 'erp_loc_a101' in schema 'bronze'
-- Drop the table if it already exists
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
DROP TABLE bronze.erp_loc_a101
GO
-- Create the table in the specified schema
CREATE TABLE bronze.erp_loc_a101
(
-- CID,CNTRY
    CID [NVARCHAR](30), -- primary key column
    CNTRY [NVARCHAR](50)
);
GO


-- Create a new table called 'erp_px_cat_g1v2' in schema 'bronze'
-- Drop the table if it already exists
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
DROP TABLE bronze.erp_px_cat_g1v2
GO
-- Create the table in the specified schema
CREATE TABLE bronze.erp_px_cat_g1v2
(
-- ID,CAT,SUBCAT,MAINTENANCE
    ID [NVARCHAR] (20), -- primary key column
    CAT [NVARCHAR](50),
    SUBCAT [NVARCHAR](50),
    MAINTENANCE [NVARCHAR](10)
);
GO