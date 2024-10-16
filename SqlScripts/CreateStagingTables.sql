USE ERStagingDB;
GO

IF OBJECT_ID('dbo.ERCountry', 'U') IS NOT NULL
DROP TABLE dbo.ERCountry;

CREATE TABLE ERCountry (
    country nvarchar(23),
    energyreporter_date datetime,
    electric_car_share float,
    electric_car_count int,
    electric_car_share_last_change datetime,
    electric_car_charging_spot_count int,
    electric_cars_per_charging_spot float,
    electric_car_charging_spot_last_change datetime,
    solar_potential_usage float,
    solar_power_installed_kwp int,
    solar_potential_usage_last_change datetime,
    renewable_heating_share float,
    renewable_heating_count int,
    non_renewable_heating_count int,
    no_heating_count int,
    renewable_heating_share_coverage float,
    renewable_heating_share_last_change datetime,
    elec_consumption_mwh_per_year_per_capita float,
    elec_consumption_households_mwh_per_year_per_capita float,
    elec_consumption_mwh_per_year bigint,
    elec_consumption_households_mwh_per_year int,
    elec_consumption_date_from datetime,
    elec_consumption_date_until datetime,
    renelec_production_mwh_per_year_per_capita float,
    renelec_production_mwh_per_year bigint,
    renelec_production_water_mwh_per_year int,
    renelec_production_solar_mwh_per_year int,
    renelec_production_wind_mwh_per_year int,
    renelec_production_biomass_mwh_per_year int,
    renelec_production_waste_mwh_per_year int,
    renelec_production_date_from datetime,
    renelec_production_date_until datetime
)

IF OBJECT_ID('dbo.ERCanton', 'U') IS NOT NULL
DROP TABLE dbo.ERCanton;

CREATE TABLE ERCanton (
    canton varchar(2),
    energyreporter_date datetime,
    electric_car_share float,
    electric_car_count int,
    electric_car_share_last_change datetime,
    electric_car_charging_spot_count int,
    electric_cars_per_charging_spot float,
    electric_car_charging_spot_last_change datetime,
    solar_potential_usage float,
    solar_power_installed_kwp int,
    solar_potential_usage_last_change datetime,
    renewable_heating_share float,
    renewable_heating_count int,
    non_renewable_heating_count int,
    no_heating_count int,
    renewable_heating_share_coverage float,
    renewable_heating_share_last_change datetime,
    elec_consumption_mwh_per_year_per_capita float,
    elec_consumption_households_mwh_per_year_per_capita float,
    elec_consumption_mwh_per_year bigint,
    elec_consumption_households_mwh_per_year int,
    elec_consumption_date_from datetime,
    elec_consumption_date_until datetime,
    renelec_production_mwh_per_year_per_capita float,
    renelec_production_mwh_per_year bigint,
    renelec_production_water_mwh_per_year int,
    renelec_production_solar_mwh_per_year int,
    renelec_production_wind_mwh_per_year int,
    renelec_production_biomass_mwh_per_year int,
    renelec_production_waste_mwh_per_year int,
    renelec_production_date_from datetime,
    renelec_production_date_until datetime
)

IF OBJECT_ID('dbo.ERMunicipality', 'U') IS NOT NULL
DROP TABLE dbo.ERMunicipality;

CREATE TABLE ERMunicipality (
    bfs_nr smallint,
    municipality nvarchar(120),
    canton nvarchar(2),
    bfs_municipality_type_2012_25 smallint,
    energyreporter_date datetime,
    electric_car_share float,
    electric_car_count int,
    electric_car_share_last_change datetime,
    electric_car_charging_spot_count int,
    electric_cars_per_charging_spot float,
    electric_car_charging_spot_last_change datetime,
    solar_potential_usage float,
    solar_power_installed_kwp int,
    solar_potential_usage_last_change datetime,
    renewable_heating_share float,
    renewable_heating_count int,
    non_renewable_heating_count int,
    no_heating_count int,
    renewable_heating_share_coverage float,
    renewable_heating_share_last_change datetime,
    elec_consumption_mwh_per_year_per_capita float,
    elec_consumption_households_mwh_per_year_per_capita float,
    elec_consumption_mwh_per_year bigint,
    elec_consumption_households_mwh_per_year int,
    elec_consumption_date_from datetime,
    elec_consumption_date_until datetime,
    renelec_production_mwh_per_year_per_capita float,
    renelec_production_mwh_per_year bigint,
    renelec_production_water_mwh_per_year int,
    renelec_production_solar_mwh_per_year int,
    renelec_production_wind_mwh_per_year int,
    renelec_production_biomass_mwh_per_year int,
    renelec_production_waste_mwh_per_year int,
    renelec_production_date_from datetime,
    renelec_production_date_until datetime
)
