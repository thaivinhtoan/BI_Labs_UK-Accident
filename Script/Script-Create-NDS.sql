create database NDS
go

use NDS
go

CREATE TABLE [NDS_Local_Authority_District] (
	[ID] int IDENTITY(1,1) PRIMARY KEY,
    [code] smallint unique,
    [label] nvarchar(255),
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [NDS_Vehicle_Type] (
	[ID_Vehicle_Type] int IDENTITY(1,1) PRIMARY KEY,
    [code] smallint unique,
    [label] nvarchar(255),
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [NDS_Sex_of_Driver] (
	[ID_Sex_of_Driver] int IDENTITY(1,1) PRIMARY KEY,
    [code] smallint unique,
    [label] nvarchar(255),
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [NDS_Age_Band] (
	[ID_Age_Band] int IDENTITY(1,1) PRIMARY KEY,
    [code] smallint unique,
    [label] nvarchar(255),
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [NDS_Casualty_Class] (
	[ID_Casualty_Class] int IDENTITY(1,1) PRIMARY KEY,
    [code] smallint unique,
    [label] nvarchar(255),
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [NDS_Sex_of_Casualty] (
	[ID_Sex_of_Casualty] int IDENTITY(1,1) PRIMARY KEY,
    [code] smallint unique,
    [label] nvarchar(255),
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [NDS_Casualty_Severity] (
	[ID_Casualty_Severity] int IDENTITY(1,1) PRIMARY KEY,
    [code] smallint unique,
    [label] nvarchar(255),
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [NDS_Casualty_Type] (
	[ID_Casualty_Type] int IDENTITY(1,1) PRIMARY KEY,
    [code] smallint unique,
    [label] nvarchar(255),
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)
CREATE TABLE [NDS_Journey_Purpose] (
	[ID_Journey_Purpose] int IDENTITY(1,1) PRIMARY KEY,
    [code] smallint unique,
    [label] nvarchar(255),
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [NDS_Home_Area_Type] (
	[ID_Home_Area_Type] int IDENTITY(1,1) PRIMARY KEY,
    [code] smallint unique,
    [label] nvarchar(255),
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [NDS_Road_Type] (
	[ID_Road_Type] int IDENTITY(1,1) PRIMARY KEY,
    [code] smallint unique,
    [label] nvarchar(255),
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [NDS_Accident_Severity] (
	[ID_Accident_Severity] int IDENTITY(1,1) PRIMARY KEY,
    [code] smallint unique,
    [label] nvarchar(255),
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [NDS_Urban_Rural] (
	[ID_Urban_Rural] int IDENTITY(1,1) PRIMARY KEY,
    [code] smallint unique,
    [label] nvarchar(255),
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [NDS_Source] (
	[ID_Source] int IDENTITY(1,1) PRIMARY KEY,
    [source_name] nvarchar(255),
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)




CREATE TABLE [NDS_LSOA] (
	[ID_LSOA] int IDENTITY(1,1) PRIMARY KEY,
    [pcd8] varchar(50),
    [lsoa11cd] varchar(50) unique,
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)


CREATE TABLE [NDS_Accident] (
	[ID_Accident] int IDENTITY(1,1) PRIMARY KEY,
    [Accident_Index] varchar(50) unique,
    [Location_Easting_OSGR] int,
    [Location_Northing_OSGR] int,
    [Longitude] float,
    [Latitude] float,
	[Number_of_Vehicles] int,
	[Number_of_Casualties] int,
    [Accident_Severity] int,
    [Date] Date,
    [Time] time,
    [Local_Authority_(District)] int,
    [Road_Type] int,
    [Speed_limit] smallint,
    [Urban_or_Rural_Area] int,
    [LSOA_of_Accident_Location] int,
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime,
    CONSTRAINT FK_NDS_Accident_LSOA FOREIGN KEY (LSOA_of_Accident_Location)
    REFERENCES [NDS_LSOA](ID_LSOA),

    CONSTRAINT FK_NDS_Accident_Local_Authority FOREIGN KEY ([Local_Authority_(District)])
    REFERENCES [NDS_Local_Authority_District]([ID]),

    CONSTRAINT FK_NDS_Accident_Road_Type FOREIGN KEY (Road_Type)
    REFERENCES [NDS_Road_Type](ID_Road_Type),

    CONSTRAINT FK_NDS_Accident_Urban_or_Rural FOREIGN KEY (Urban_or_Rural_Area)
    REFERENCES [NDS_Urban_Rural](ID_Urban_Rural),

    CONSTRAINT FK_NDS_Accident_Accident_Severity FOREIGN KEY (Accident_Severity)
    REFERENCES [NDS_Accident_Severity](ID_Accident_Severity)
)



CREATE TABLE [NDS_Country] (
	[ID_Country] int IDENTITY(1,1) PRIMARY KEY,
    [country_code] varchar(50),
    [country_name] varchar(50),
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [NDS_Region] (
	[ID_Region] int IDENTITY(1,1) PRIMARY KEY,
    [region_code] varchar(50),
    [region_name] varchar(50),
	[ID_Country] int ,
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime,
	CONSTRAINT FK_NDS_Region_Country FOREIGN KEY (ID_Country)
    REFERENCES [NDS_Country](ID_Country)
)

CREATE TABLE [NDS_County] (
	[ID_County] int IDENTITY(1,1) PRIMARY KEY,
    [county_name] varchar(50),
	[ID_Region] int,
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime,
	CONSTRAINT FK_NDS_County_Region FOREIGN KEY ([ID_Region])
    REFERENCES [NDS_Region]([ID_Region])
)

CREATE TABLE [NDS_City] (
	[ID_City] int IDENTITY(1,1) PRIMARY KEY,
    [city_name] varchar(50),
	[ID_County] int,
	[SourceID] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime,
	CONSTRAINT FK_NDS_City_county FOREIGN KEY (ID_County)
    REFERENCES [NDS_County](ID_County)
)

CREATE TABLE [NDS_Postcode] (
	[ID_Postcode] int IDENTITY(1,1) PRIMARY KEY,
    [postcode] varchar(8),
	[SourceID] int,
    [easting] int,
    [northing] int,
    [latitude] float,
    [longitude] float,
    [ID_City] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime,
	CONSTRAINT FK_NDS_PostCode_City FOREIGN KEY ([ID_City])
    REFERENCES [NDS_City]([ID_City])
)

CREATE TABLE [NDS_Vehicle] (
	[ID_Vehicle] int IDENTITY(1,1) PRIMARY KEY,
    [Accident_Index] int,
	[Vehicle_Reference] smallint,
	[SourceID] int,
    [Vehicle_Type] int,
    [Age_Band_of_Driver] int,
    [Driver_Home_Area_Type] int,
    [Journey_Purpose_of_Driver] int,
    [Sex_of_Driver] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime,

	CONSTRAINT FK_NDS_Vehicle_Accident FOREIGN KEY ([Accident_Index])
    REFERENCES [NDS_Accident]([ID_Accident]),
	
	CONSTRAINT FK_NDS_Vehicle_Vehicle_Type FOREIGN KEY ([Vehicle_Type])
    REFERENCES [NDS_Vehicle_Type](ID_Vehicle_Type),
	
	CONSTRAINT FK_NDS_Vehicle_Age_Band FOREIGN KEY ([Age_Band_of_Driver])
    REFERENCES [NDS_Age_Band](ID_Age_Band),
	
	CONSTRAINT FK_NDS_Vehicle_Home_Area_Type FOREIGN KEY ([Driver_Home_Area_Type])
    REFERENCES [NDS_Home_Area_Type](ID_Home_Area_Type),
	
	CONSTRAINT FK_NDS_Vehicle_Journey_Purpose FOREIGN KEY ([Journey_Purpose_of_Driver])
    REFERENCES [NDS_Journey_Purpose](ID_Journey_Purpose),
	
	CONSTRAINT FK_NDS_Vehicle_Sex_of_Driver FOREIGN KEY ([Sex_of_Driver])
    REFERENCES [NDS_Sex_of_Driver](ID_Sex_of_Driver),
)

CREATE TABLE [NDS_Casualties] (
	[ID_Casualties] int IDENTITY(1,1) PRIMARY KEY,
    [Accident_Index] int,
	[Vehicle_Reference] int,
	[Casualty_Reference] smallint,
	[SourceID] int,
    [Casualty_Class] int,
    [Sex_of_Casualty] int,
	[Age_of_Casualty] int,
    [Age_Band_of_Casualty] int,
    [Casualty_Severity] int,
    [Casualty_Type] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime,
	
	CONSTRAINT FK_NDS_Casualties_Accident FOREIGN KEY ([Accident_Index])
    REFERENCES [NDS_Accident]([ID_Accident]),
	
	CONSTRAINT FK_NDS_Casualties_Vehicle FOREIGN KEY ([Vehicle_Reference])
    REFERENCES [NDS_Vehicle]([ID_Vehicle]),

	CONSTRAINT FK_NDS_Casualties_Casualty_Class FOREIGN KEY ([Casualty_Class])
    REFERENCES [NDS_Casualty_Class](ID_Casualty_Class),

	CONSTRAINT FK_NDS_Casualties_Sex_of_Casualty FOREIGN KEY ([Sex_of_Casualty])
    REFERENCES [NDS_Sex_of_Casualty](ID_Sex_of_Casualty),

	CONSTRAINT FK_NDS_Casualties_Age_Band FOREIGN KEY ([Age_Band_of_Casualty])
    REFERENCES [NDS_Age_Band](ID_Age_Band),

	CONSTRAINT FK_NDS_Casualties_Casualty_Severity FOREIGN KEY ([Casualty_Severity])
    REFERENCES [NDS_Casualty_Severity](ID_Casualty_Severity),

	CONSTRAINT FK_NDS_Casualties_Casualty_Type FOREIGN KEY ([Casualty_Type])
    REFERENCES [NDS_Casualty_Type](ID_Casualty_Type)
)

insert into [NDS_Source] (source_name, Created_Date, Updated_Date) 
values ('File CSV','2020-11-17 00:00:00.000','2020-11-17 00:00:00.000')
