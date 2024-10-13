USE EnergieReporter;
GO

PRINT 'Create Dimension Tables';
GO

PRINT 'Creating Gemeinde Table';
CREATE TABLE Gemeinde (
    GemeindeID INT IDENTITY(1,1) PRIMARY KEY,
    BfsNummer INT NOT NULL UNIQUE,
    Gemeindename NVARCHAR(255) NOT NULL,
    Kanton NVARCHAR(2) NOT NULL,
    Gemeindetyp INT NULL
);
GO

PRINT 'Creating Kanton Table';
CREATE TABLE Kanton (
    KantonID INT IDENTITY(1,1) PRIMARY KEY,
    Kanton NVARCHAR(2) NOT NULL UNIQUE,
    KantonName NVARCHAR(255) NOT NULL
);
GO

PRINT 'Creating Land Table';
CREATE TABLE Land (
    LandID INT IDENTITY(1,1) PRIMARY KEY,
    Land NVARCHAR(255) NOT NULL,
    ISOCode NVARCHAR(2) NOT NULL UNIQUE
);
GO

PRINT 'Creating Zeit Table';
CREATE TABLE Zeit (
    DateKey INT PRIMARY KEY, -- Format YYYYMMDD
    Datum DATE NOT NULL,
    Tag INT NOT NULL,
    Monat INT NOT NULL,
    Monatsname NVARCHAR(20) NOT NULL,
    Quartal NVARCHAR(2) NOT NULL,
    Jahr INT NOT NULL
);
GO
