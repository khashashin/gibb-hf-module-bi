PRINT 'Dropping existing database if it exists...';
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'EnergieReporter')
BEGIN
    ALTER DATABASE EnergieReporter SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE EnergieReporter;
    PRINT 'Database EnergieReporter dropped.';
END
ELSE
BEGIN
    PRINT 'Database EnergieReporter does not exist.';
END
GO

PRINT 'Creating new database EnergieReporter...';
CREATE DATABASE EnergieReporter;
GO

PRINT 'Database EnergieReporter created.';
GO
