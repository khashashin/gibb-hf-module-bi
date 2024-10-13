USE EnergieReporter;
GO

PRINT 'Create Fact Table';
GO

PRINT 'Creating EnergyData Table';
CREATE TABLE EnergyData (
    FactID INT IDENTITY(1,1) PRIMARY KEY,
    GemeindeID INT NULL,
    KantonID INT NULL,
    LandID INT NULL,
    DateKey INT NOT NULL,

    -- Electric Car Measures
    ElectricCarShare FLOAT NULL,
    ElectricCarCount INT NULL,
    ElectricCarShareLastChange DATETIME NULL,
    ElectricCarChargingSpotCount INT NULL,
    ElectricCarsPerChargingSpot FLOAT NULL,
    ElectricCarChargingSpotLastChange DATETIME NULL,

    -- Solar Measures
    SolarPotentialUsage FLOAT NULL,
    SolarPowerInstalledKWp INT NULL,
    SolarPotentialUsageLastChange DATETIME NULL,

    -- Renewable Heating Measures
    RenewableHeatingShare FLOAT NULL,
    RenewableHeatingCount INT NULL,
    NonRenewableHeatingCount INT NULL,
    NoHeatingCount INT NULL,
    RenewableHeatingShareCoverage FLOAT NULL,
    RenewableHeatingShareLastChange DATETIME NULL,

    -- Electricity Consumption Measures
    ElecConsumptionMWhPerYearPerCapita FLOAT NULL,
    ElecConsumptionHouseholdsMWhPerYearPerCapita FLOAT NULL,
    ElecConsumptionMWhPerYear BIGINT NULL,
    ElecConsumptionHouseholdsMWhPerYear BIGINT NULL,
    ElecConsumptionDateFrom DATETIME NULL,
    ElecConsumptionDateUntil DATETIME NULL,

    -- Renewable Electricity Production Measures
    RenelecProductionMWhPerYearPerCapita FLOAT NULL,
    RenelecProductionMWhPerYear BIGINT NULL,
    RenelecProductionWaterMWhPerYear BIGINT NULL,
    RenelecProductionSolarMWhPerYear BIGINT NULL,
    RenelecProductionWindMWhPerYear BIGINT NULL,
    RenelecProductionBiomassMWhPerYear BIGINT NULL,
    RenelecProductionWasteMWhPerYear BIGINT NULL,
    RenelecProductionDateFrom DATETIME NULL,
    RenelecProductionDateUntil DATETIME NULL,

    -- Foreign Keys
    FOREIGN KEY (GemeindeID) REFERENCES Gemeinde(GemeindeID),
    FOREIGN KEY (KantonID) REFERENCES Kanton(KantonID),
    FOREIGN KEY (LandID) REFERENCES Land(LandID),
    FOREIGN KEY (DateKey) REFERENCES Zeit(DateKey)
);
GO
