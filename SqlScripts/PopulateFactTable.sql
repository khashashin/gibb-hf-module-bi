USE EnergieReporter;
GO

PRINT 'Populate Fact Table';
GO

BEGIN TRY
    BEGIN TRANSACTION;

        PRINT 'Populating Fact_EnergyData Table from Municipality Historized Data';
        INSERT INTO Fact_EnergyData (
            GemeindeID,
            KantonID,
            LandID,
            DateKey,
            ElectricCarShare,
            ElectricCarCount,
            ElectricCarShareLastChange,
            ElectricCarChargingSpotCount,
            ElectricCarsPerChargingSpot,
            ElectricCarChargingSpotLastChange,
            SolarPotentialUsage,
            SolarPowerInstalledKWp,
            SolarPotentialUsageLastChange,
            RenewableHeatingShare,
            RenewableHeatingCount,
            NonRenewableHeatingCount,
            NoHeatingCount,
            RenewableHeatingShareCoverage,
            RenewableHeatingShareLastChange,
            ElecConsumptionMWhPerYearPerCapita,
            ElecConsumptionHouseholdsMWhPerYearPerCapita,
            ElecConsumptionMWhPerYear,
            ElecConsumptionHouseholdsMWhPerYear,
            ElecConsumptionDateFrom,
            ElecConsumptionDateUntil,
            RenelecProductionMWhPerYearPerCapita,
            RenelecProductionMWhPerYear,
            RenelecProductionWaterMWhPerYear,
            RenelecProductionSolarMWhPerYear,
            RenelecProductionWindMWhPerYear,
            RenelecProductionBiomassMWhPerYear,
            RenelecProductionWasteMWhPerYear,
            RenelecProductionDateFrom,
            RenelecProductionDateUntil
        )
        SELECT
            G.GemeindeID,
            K.KantonID,
            NULL AS LandID,
            Z.DateKey,
            em.electric_car_share,
            em.electric_car_count,
            em.electric_car_share_last_change,
            em.electric_car_charging_spot_count,
            em.electric_cars_per_charging_spot,
            em.electric_car_charging_spot_last_change,
            em.solar_potential_usage,
            em.solar_power_installed_kwp,
            em.solar_potential_usage_last_change,
            em.renewable_heating_share,
            em.renewable_heating_count,
            em.non_renewable_heating_count,
            em.no_heating_count,
            em.renewable_heating_share_coverage,
            em.renewable_heating_share_last_change,
            em.elec_consumption_mwh_per_year_per_capita,
            em.elec_consumption_households_mwh_per_year_per_capita,
            em.elec_consumption_mwh_per_year,
            em.elec_consumption_households_mwh_per_year,
            em.elec_consumption_date_from,
            em.elec_consumption_date_until,
            em.renelec_production_mwh_per_year_per_capita,
            em.renelec_production_mwh_per_year,
            em.renelec_production_water_mwh_per_year,
            em.renelec_production_solar_mwh_per_year,
            em.renelec_production_wind_mwh_per_year,
            em.renelec_production_biomass_mwh_per_year,
            em.renelec_production_waste_mwh_per_year,
            em.renelec_production_date_from,
            em.renelec_production_date_until
        FROM ERStagingDB.dbo.ERMunicipality AS em
        INNER JOIN Dim_Gemeinde AS G ON em.bfs_nr = G.BfsNummer
        INNER JOIN Dim_Kanton AS K ON em.canton = K.Kanton
        INNER JOIN Dim_Zeit AS Z ON (YEAR(em.energyreporter_date) * 10000) + (MONTH(em.energyreporter_date) * 100) + DAY(em.energyreporter_date) = Z.DateKey;

        PRINT 'Populating Fact_EnergyData Table from Canton Historized Data';
        INSERT INTO Fact_EnergyData (
            GemeindeID,
            KantonID,
            LandID,
            DateKey,
            ElectricCarShare,
            ElectricCarCount,
            ElectricCarShareLastChange,
            ElectricCarChargingSpotCount,
            ElectricCarsPerChargingSpot,
            ElectricCarChargingSpotLastChange,
            SolarPotentialUsage,
            SolarPowerInstalledKWp,
            SolarPotentialUsageLastChange,
            RenewableHeatingShare,
            RenewableHeatingCount,
            NonRenewableHeatingCount,
            NoHeatingCount,
            RenewableHeatingShareCoverage,
            RenewableHeatingShareLastChange,
            ElecConsumptionMWhPerYearPerCapita,
            ElecConsumptionHouseholdsMWhPerYearPerCapita,
            ElecConsumptionMWhPerYear,
            ElecConsumptionHouseholdsMWhPerYear,
            ElecConsumptionDateFrom,
            ElecConsumptionDateUntil,
            RenelecProductionMWhPerYearPerCapita,
            RenelecProductionMWhPerYear,
            RenelecProductionWaterMWhPerYear,
            RenelecProductionSolarMWhPerYear,
            RenelecProductionWindMWhPerYear,
            RenelecProductionBiomassMWhPerYear,
            RenelecProductionWasteMWhPerYear,
            RenelecProductionDateFrom,
            RenelecProductionDateUntil
        )
        SELECT
            NULL AS GemeindeID,  -- GemeindeID is NULL for canton-level data
            K.KantonID,
            NULL AS LandID,
            Z.DateKey,
            ec.electric_car_share,
            ec.electric_car_count,
            ec.electric_car_share_last_change,
            ec.electric_car_charging_spot_count,
            ec.electric_cars_per_charging_spot,
            ec.electric_car_charging_spot_last_change,
            ec.solar_potential_usage,
            ec.solar_power_installed_kwp,
            ec.solar_potential_usage_last_change,
            ec.renewable_heating_share,
            ec.renewable_heating_count,
            ec.non_renewable_heating_count,
            ec.no_heating_count,
            ec.renewable_heating_share_coverage,
            ec.renewable_heating_share_last_change,
            ec.elec_consumption_mwh_per_year_per_capita,
            ec.elec_consumption_households_mwh_per_year_per_capita,
            ec.elec_consumption_mwh_per_year,
            ec.elec_consumption_households_mwh_per_year,
            ec.elec_consumption_date_from,
            ec.elec_consumption_date_until,
            ec.renelec_production_mwh_per_year_per_capita,
            ec.renelec_production_mwh_per_year,
            ec.renelec_production_water_mwh_per_year,
            ec.renelec_production_solar_mwh_per_year,
            ec.renelec_production_wind_mwh_per_year,
            ec.renelec_production_biomass_mwh_per_year,
            ec.renelec_production_waste_mwh_per_year,
            ec.renelec_production_date_from,
            ec.renelec_production_date_until
        FROM ERStagingDB.dbo.ERCanton AS ec
        INNER JOIN Dim_Kanton AS K ON ec.canton = K.Kanton
        INNER JOIN Dim_Zeit AS Z ON (YEAR(ec.energyreporter_date) * 10000) + (MONTH(ec.energyreporter_date) * 100) + DAY(ec.energyreporter_date) = Z.DateKey;

        PRINT 'Populating Fact_EnergyData Table from Country Historized Data';
        INSERT INTO Fact_EnergyData (
            GemeindeID,
            KantonID,
            LandID,
            DateKey,
            ElectricCarShare,
            ElectricCarCount,
            ElectricCarShareLastChange,
            ElectricCarChargingSpotCount,
            ElectricCarsPerChargingSpot,
            ElectricCarChargingSpotLastChange,
            SolarPotentialUsage,
            SolarPowerInstalledKWp,
            SolarPotentialUsageLastChange,
            RenewableHeatingShare,
            RenewableHeatingCount,
            NonRenewableHeatingCount,
            NoHeatingCount,
            RenewableHeatingShareCoverage,
            RenewableHeatingShareLastChange,
            ElecConsumptionMWhPerYearPerCapita,
            ElecConsumptionHouseholdsMWhPerYearPerCapita,
            ElecConsumptionMWhPerYear,
            ElecConsumptionHouseholdsMWhPerYear,
            ElecConsumptionDateFrom,
            ElecConsumptionDateUntil,
            RenelecProductionMWhPerYearPerCapita,
            RenelecProductionMWhPerYear,
            RenelecProductionWaterMWhPerYear,
            RenelecProductionSolarMWhPerYear,
            RenelecProductionWindMWhPerYear,
            RenelecProductionBiomassMWhPerYear,
            RenelecProductionWasteMWhPerYear,
            RenelecProductionDateFrom,
            RenelecProductionDateUntil
        )
        SELECT
            NULL AS GemeindeID,  -- GemeindeID is NULL for national-level data
            NULL AS KantonID,    -- KantonID is NULL for national-level data
            L.LandID,
            Z.DateKey,
            en.electric_car_share,
            en.electric_car_count,
            en.electric_car_share_last_change,
            en.electric_car_charging_spot_count,
            en.electric_cars_per_charging_spot,
            en.electric_car_charging_spot_last_change,
            en.solar_potential_usage,
            en.solar_power_installed_kwp,
            en.solar_potential_usage_last_change,
            en.renewable_heating_share,
            en.renewable_heating_count,
            en.non_renewable_heating_count,
            en.no_heating_count,
            en.renewable_heating_share_coverage,
            en.renewable_heating_share_last_change,
            en.elec_consumption_mwh_per_year_per_capita,
            en.elec_consumption_households_mwh_per_year_per_capita,
            en.elec_consumption_mwh_per_year,
            en.elec_consumption_households_mwh_per_year,
            en.elec_consumption_date_from,
            en.elec_consumption_date_until,
            en.renelec_production_mwh_per_year_per_capita,
            en.renelec_production_mwh_per_year,
            en.renelec_production_water_mwh_per_year,
            en.renelec_production_solar_mwh_per_year,
            en.renelec_production_wind_mwh_per_year,
            en.renelec_production_biomass_mwh_per_year,
            en.renelec_production_waste_mwh_per_year,
            en.renelec_production_date_from,
            en.renelec_production_date_until
        FROM ERStagingDB.dbo.ERCountry AS en
        CROSS JOIN Dim_Land AS L  -- Since there is only one country, we can CROSS JOIN
        INNER JOIN Dim_Zeit AS Z ON (YEAR(en.energyreporter_date) * 10000) + (MONTH(en.energyreporter_date) * 100) + DAY(en.energyreporter_date) = Z.DateKey;

    COMMIT TRANSACTION;
    PRINT 'Fact_EnergyData Table populated successfully.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    PRINT 'Error occurred while populating Fact_EnergyData Table: ' + @ErrorMessage;
    THROW; -- Re-throw the error to be handled by the calling process if needed
END CATCH;
GO
