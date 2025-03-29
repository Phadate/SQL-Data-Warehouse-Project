/* 
============================================================================

Create Database and Schemas

===========================================================================

Script Purpose:

    This script creates a new database named 'Datawarehouse' after checking if it already exists.
    if the database exists, it is dropped and recreated. Addtionally, the script set up three schemas 
    within the database: 'bronze', 'silver', and 'gold'

WARNING⚠:
    Running this script will drop the entire database if it exists
    All data in the database will be permanently dleted. Proceed with the highest caution
    and ensure you have proper backups before executing this scripts.

*/


-- Connect to the 'master' database to run this snippet
USE master;
GO

-- Create the new database if it does not exist already
IF EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = 'DataWarehouse'
)
-- delete/drop database of it exists
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;

-- Create a new database called 'DataWarehouse'
CREATE DATABASE DataWarehouse
GO

USE DataWarehouse;
GO

-- Create schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO