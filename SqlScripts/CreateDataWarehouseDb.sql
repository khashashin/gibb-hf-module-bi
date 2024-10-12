PRINT 'Dropping existing database if it exists...';
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'ERDataWarehouseDB')
BEGIN
    ALTER DATABASE ERDataWarehouseDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE ERDataWarehouseDB;
    PRINT 'Database ERDataWarehouseDB dropped.';
END
ELSE
BEGIN
    PRINT 'Database ERDataWarehouseDB does not exist.';
END
GO

PRINT 'Creating new database ERDataWarehouseDB...';
CREATE DATABASE ERDataWarehouseDB;
GO

PRINT 'Database ERDataWarehouseDB created.';
GO