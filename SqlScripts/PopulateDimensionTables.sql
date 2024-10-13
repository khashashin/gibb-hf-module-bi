USE EnergieReporter;
GO

PRINT 'Populate Dimension Tables';
GO

BEGIN TRY
    BEGIN TRANSACTION;

        PRINT 'Populating Dim_Gemeinde Table';
        WITH MunicipalityData AS (
            SELECT
                bfs_nr,
                municipality,
                canton,
                bfs_municipality_type_2012_25,
                ROW_NUMBER() OVER (PARTITION BY bfs_nr ORDER BY municipality) AS RowNum
            FROM ERStagingDB.dbo.ERMunicipality
        )
        INSERT INTO Dim_Gemeinde (BfsNummer, Gemeindename, Kanton, Gemeindetyp)
        SELECT
            bfs_nr,
            municipality,
            canton,
            bfs_municipality_type_2012_25
        FROM MunicipalityData
        WHERE RowNum = 1;

        IF OBJECT_ID('tempdb..#KantonNames') IS NOT NULL
        DROP TABLE #KantonNames;

        PRINT 'Creating and Populating temporary table for Canton names';
        CREATE TABLE #KantonNames (
            Kanton NVARCHAR(2),
            KantonName NVARCHAR(255)
        );

        INSERT INTO #KantonNames (Kanton, KantonName)
        VALUES
        ('AG', 'Aargau'),
        ('AI', 'Appenzell Innerrhoden'),
        ('AR', 'Appenzell Ausserrhoden'),
        ('BE', 'Bern'),
        ('BL', 'Basel-Landschaft'),
        ('BS', 'Basel-Stadt'),
        ('FR', 'Freiburg'),
        ('GE', 'Genf'),
        ('GL', 'Glarus'),
        ('GR', 'Graubünden'),
        ('JU', 'Jura'),
        ('LU', 'Luzern'),
        ('NE', 'Neuenburg'),
        ('NW', 'Nidwalden'),
        ('OW', 'Obwalden'),
        ('SG', 'St. Gallen'),
        ('SH', 'Schaffhausen'),
        ('SO', 'Solothurn'),
        ('SZ', 'Schwyz'),
        ('TG', 'Thurgau'),
        ('TI', 'Tessin'),
        ('UR', 'Uri'),
        ('VD', 'Waadt'),
        ('VS', 'Wallis'),
        ('ZG', 'Zug'),
        ('ZH', 'Zürich');

        PRINT 'Populating Dim_Kanton Table';
        INSERT INTO Dim_Kanton (Kanton, KantonName)
        SELECT DISTINCT
            E.canton AS Kanton,
            K.KantonName
        FROM (
            SELECT canton FROM ERStagingDB.dbo.ERCanton
            UNION
            SELECT canton FROM ERStagingDB.dbo.ERMunicipality
        ) AS E
        LEFT JOIN #KantonNames AS K ON E.canton = K.Kanton;

        DROP TABLE #KantonNames;

        PRINT 'Populating Dim_Land Table';
        INSERT INTO Dim_Land (Land, ISOCode)
        VALUES ('Schweiz', 'CH');

        PRINT 'Populating Dim_Zeit Table';
        INSERT INTO Dim_Zeit (DateKey, Datum, Tag, Monat, Monatsname, Quartal, Jahr)
        SELECT
            (YEAR(energyreporter_date) * 10000) + (MONTH(energyreporter_date) * 100) + DAY(energyreporter_date) AS DateKey,
            CAST(energyreporter_date AS DATE) AS Datum,
            DAY(energyreporter_date) AS Tag,
            MONTH(energyreporter_date) AS Monat,
            DATENAME(MONTH, energyreporter_date) AS Monatsname,
            'Q' + CAST(DATEPART(QUARTER, energyreporter_date) AS NVARCHAR(1)) AS Quartal,
            YEAR(energyreporter_date) AS Jahr
        FROM (
            SELECT DISTINCT energyreporter_date FROM ERStagingDB.dbo.ERCountry
            UNION
            SELECT DISTINCT energyreporter_date FROM ERStagingDB.dbo.ERCanton
            UNION
            SELECT DISTINCT energyreporter_date FROM ERStagingDB.dbo.ERMunicipality
        ) AS Dates;

    COMMIT TRANSACTION;
    PRINT 'Dimension Tables populated successfully.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    PRINT 'Error occurred while populating Dimension Tables: ' + @ErrorMessage;
    THROW; -- Re-throw the error to be handled by the calling process if needed
END CATCH;
GO

CREATE NONCLUSTERED INDEX IX_Dim_Gemeinde_BfsNummer ON Dim_Gemeinde(BfsNummer);
CREATE NONCLUSTERED INDEX IX_Dim_Kanton_Kanton ON Dim_Kanton(Kanton);
CREATE NONCLUSTERED INDEX IX_Dim_Zeit_DateKey ON Dim_Zeit(DateKey);
GO
