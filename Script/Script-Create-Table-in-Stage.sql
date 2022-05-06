CREATE TABLE [Stage_Accident] (
    [Accident_Index] varchar(50),
    [Location_Easting_OSGR] int,
    [Location_Northing_OSGR] int,
    [Longitude] float,
    [Latitude] float,
	[Number_of_Vehicles] int,
	[Number_of_Casualties] int,
    [Accident_Severity] smallint,
    [Date] Date,
    [Time] varchar(50),
    [Local_Authority_(District)] smallint,
    [Road_Type] smallint,
    [Speed_limit] smallint,
    [Urban_or_Rural_Area] smallint,
    [LSOA_of_Accident_Location] varchar(50)
)

CREATE TABLE [Stage_Postcode] (
    [postcode] varchar(8),
    [easting] int,
    [northing] int,
    [latitude] float,
    [longitude] float,
    [city] varchar(50),
    [county] varchar(50),
    [country_code] varchar(50),
    [country_name] varchar(50),
    [region_code] varchar(50),
    [region_name] varchar(50)
)

CREATE TABLE [Stage_Casualties] (
    [Accident_Index] varchar(50),
	[Vehicle_Reference] smallint,
	[Casualty_Reference] smallint,
    [Casualty_Class] smallint,
    [Sex_of_Casualty] smallint,
	[Age_of_Casualty] int,
    [Age_Band_of_Casualty] smallint,
    [Casualty_Severity] smallint,
    [Casualty_Type] smallint
)

CREATE TABLE [Stage_Vehicle] (
    [Accident_Index] varchar(50),
	[Vehicle_Reference] smallint,
    [Vehicle_Type] smallint,
    [Age_Band_of_Driver] smallint,
    [Driver_Home_Area_Type] smallint,
    [Journey_Purpose_of_Driver] smallint,
    [Sex_of_Driver] smallint
)

CREATE TABLE [Stage_LSOA] (
    [pcd8] varchar(50),
    [lsoa11cd] varchar(50)
)


CREATE TABLE [Stage_Local_Authority_District] (
    [code] smallint,
    [label] nvarchar(255)
)

CREATE TABLE [Stage_Vehicle_Type] (
    [code] smallint,
    [label] nvarchar(255)
)

CREATE TABLE [Stage_Sex_of_Driver] (
    [code] smallint,
    [label] nvarchar(255)
)

CREATE TABLE [Stage_Age_Band] (
    [code] smallint,
    [label] nvarchar(255)
)

CREATE TABLE [Stage_Casualty_Class] (
    [code] smallint,
    [label] nvarchar(255)
)

CREATE TABLE [Stage_Sex_of_Casualty] (
    [code] smallint,
    [label] nvarchar(255)
)

CREATE TABLE [Stage_Casualty_Severity] (
    [code] smallint,
    [label] nvarchar(255)
)

CREATE TABLE [Stage_Casualty_Type] (
    [code] smallint,
    [label] nvarchar(255)
)
CREATE TABLE [Stage_Journey_Purpose] (
    [code] smallint,
    [label] nvarchar(255)
)

CREATE TABLE [Stage_Home_Area_Type] (
    [code] smallint,
    [label] nvarchar(255)
)

CREATE TABLE [Stage_Road_Type] (
    [code] smallint,
    [label] nvarchar(255)
)

CREATE TABLE [Stage_Accident_Severity] (
    [code] smallint,
    [label] nvarchar(255)
)

CREATE TABLE [Stage_Urban_Rural] (
    [code] smallint,
    [label] nvarchar(255)
)
