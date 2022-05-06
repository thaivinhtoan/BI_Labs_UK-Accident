create database DDS2
go

use DDS2
go

CREATE TABLE [Dim_Local_Authority_District] (
	[ID] int PRIMARY KEY,
	[code] smallint unique,
    [label] nvarchar(255),
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [Dim_Vehicle_Type] (
	[ID_Vehicle_Type] int PRIMARY KEY,
	[code] smallint unique,
    [label] nvarchar(255),
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [Dim_Age_Band] (
	[ID_Age_Band] int PRIMARY KEY,
	[code] smallint unique,
    [label] nvarchar(255),
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [Dim_Sex_of_Casualty] (
	[ID_Sex_of_Casualty] int PRIMARY KEY,
	[code] smallint unique,
    [label] nvarchar(255),
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [Dim_Casualty_Severity] (
	[ID_Casualty_Severity] int PRIMARY KEY,
	[code] smallint unique,
    [label] nvarchar(255),
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [Dim_Casualty_Type] (
	[ID_Casualty_Type] int PRIMARY KEY,
	[code] smallint unique,
    [label] nvarchar(255),
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)
CREATE TABLE [Dim_Journey_Purpose] (
	[ID_Journey_Purpose] int PRIMARY KEY,
	[code] smallint unique,
    [label] nvarchar(255),
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [Dim_Road_Type] (
	[ID_Road_Type] int PRIMARY KEY,
	[code] smallint unique,
    [label] nvarchar(255),
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [Dim_Accident_Severity] (
	[ID_Accident_Severity] int PRIMARY KEY,
	[code] smallint unique,
    [label] nvarchar(255),
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [Dim_Urban_Rural] (
	[ID_Urban_Rural] int PRIMARY KEY,
	[code] smallint unique,
    [label] nvarchar(255),
    [Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [Dim_Date] (
	[DateKey] INT IDENTITY(1,1) primary key, 
	[Date] DATE,
	[Month] VARCHAR(2), --Number of the Month 1 to 12
	[MonthName] VARCHAR(9),--January, February etc
	[Quarter] CHAR(10),
	[Year] CHAR(4),-- Year value of Date stored in Row
	[Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [Dim_Geography] (
	[GeographyKey] int PRIMARY KEY,
	[postcode] varchar(8),
	[ID_City] int,
    [city_name] varchar(50),
	[ID_County] int,
	[county_name] varchar(50),
	[ID_Region] int,
	[region_code] varchar(50),
	[region_name] varchar(50),
	[ID_Country] int ,
	[country_code] varchar(50),
    [country_name] varchar(50),
	[Created_Date] Datetime,
	[Updated_Date] Datetime
)

CREATE TABLE [Dim_TimeOfDate] (
	[TimeKey] int IDENTITY(1,1) PRIMARY KEY,
	[label] nvarchar(255),
	[Created_Date] Datetime,
	[Updated_Date] Datetime
)
insert into [Dim_TimeOfDate] ([label], Created_Date, Updated_Date) 
values ('Morning: 5am-12pm',getdate(),GETDATE());
insert into [Dim_TimeOfDate] ([label], Created_Date, Updated_Date) 
values ('Afternoon: 12pm-5pm',getdate(),GETDATE());
insert into [Dim_TimeOfDate] ([label], Created_Date, Updated_Date) 
values ('Evening: 5pm-9pm',getdate(),GETDATE());
insert into [Dim_TimeOfDate] ([label], Created_Date, Updated_Date) 
values ('Night: 9pm-5am',getdate(),GETDATE());

/*
CREATE TABLE [Dim_AgeBand2] (
	[BandKey] int IDENTITY(1,1) PRIMARY KEY,
	[label] nvarchar(255),
	[Created_Date] Datetime,
	[Updated_Date] Datetime
)
insert into [Dim_AgeBand2] ([label], Created_Date, Updated_Date) 
values ('Children: 0-15',getdate(),GETDATE());
insert into [Dim_AgeBand2] ([label], Created_Date, Updated_Date) 
values ('Young adult: 0-17',getdate(),GETDATE());
insert into [Dim_AgeBand2] ([label], Created_Date, Updated_Date) 
values ('Adults: 18-59',getdate(),GETDATE());
insert into [Dim_AgeBand2] ([label], Created_Date, Updated_Date) 
values ('60 and over',getdate(),GETDATE());
*/


CREATE TABLE [Dim_Built-up_Road] (
	[Built-up_RoadID] int IDENTITY(1,1) PRIMARY KEY,
	[label] nvarchar(255),
	[Created_Date] Datetime,
	[Updated_Date] Datetime
)
insert into [Dim_Built-up_Road] ([label], Created_Date, Updated_Date) 
values ('Built-up road',getdate(),GETDATE());
insert into [Dim_Built-up_Road] ([label], Created_Date, Updated_Date) 
values ('Non built-up road',getdate(),GETDATE());

CREATE TABLE [Fact_Accident] (
	[ID_Accident] int PRIMARY KEY,
    [Accident_Index] varchar(50) unique,
    [Accident_Severity] int,
    [Date] int,
    [TimeOfDate] int,
    [Local_Authority_(District)] int,
    [Road_Type] int,
    [Built-up_Road] int,
    [Urban_or_Rural_Area] int,
    [Geography] int,
	[Number_of_Vehicles] int,
	[Number_of_Casualties] int,
	[Status] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime,
    CONSTRAINT FK_DDS_Accident_Geography FOREIGN KEY ([Geography])
    REFERENCES [Dim_Geography]([GeographyKey]),

	CONSTRAINT FK_DDS_Accident_TimeOfDate FOREIGN KEY (TimeOfDate)
    REFERENCES [Dim_TimeOfDate]([TimeKey]),

	CONSTRAINT FK_DDS_Accident_Date FOREIGN KEY ([Date])
    REFERENCES [Dim_Date]([DateKey]),

    CONSTRAINT FK_DDS_Accident_Local_Authority FOREIGN KEY ([Local_Authority_(District)])
    REFERENCES [Dim_Local_Authority_District]([ID]),

    CONSTRAINT FK_DDS_Accident_Road_Type FOREIGN KEY (Road_Type)
    REFERENCES [Dim_Road_Type](ID_Road_Type),

	CONSTRAINT FK_DDS_Accident_Builtup_Road FOREIGN KEY ([Built-up_Road])
    REFERENCES [Dim_Built-up_Road]([Built-up_RoadID]),

    CONSTRAINT FK_DDS_Accident_Urban_or_Rural FOREIGN KEY (Urban_or_Rural_Area)
    REFERENCES [Dim_Urban_Rural](ID_Urban_Rural),

    CONSTRAINT FK_DDS_Accident_Accident_Severity FOREIGN KEY (Accident_Severity)
    REFERENCES [Dim_Accident_Severity](ID_Accident_Severity)
)

CREATE TABLE [Fact_Vehicle] (
	[ID_Vehicle] int PRIMARY KEY,
    [Vehicle_Type] int,
    [Driver_Home_Area_Type] int,
    [Journey_Purpose_of_Driver] int,
	[Status] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime,
	
	CONSTRAINT FK_NDS_Vehicle_Vehicle_Type FOREIGN KEY ([Vehicle_Type])
    REFERENCES [Dim_Vehicle_Type](ID_Vehicle_Type),
	
	CONSTRAINT FK_NDS_Vehicle_Journey_Purpose FOREIGN KEY ([Journey_Purpose_of_Driver])
    REFERENCES [Dim_Journey_Purpose](ID_Journey_Purpose),
	
)

CREATE TABLE [Fact_Casualties] (
	[ID_Casualties] int PRIMARY KEY,
	[Date] int,
    [Local_Authority_(District)] int,
    [Casualty_Class] int,
    [Sex_of_Casualty] int,
	[Age_of_Casualty] int,
    [Age_Band_of_Casualty] int,
    [Casualty_Severity] int,
    [Casualty_Type] int,
--	[Age_Band2] int,
	[Status] int,
    [Created_Date] Datetime,
	[Updated_Date] Datetime,
	
	CONSTRAINT FK_DDS_Casualties_Date FOREIGN KEY ([Date])
    REFERENCES [Dim_Date]([DateKey]),

	CONSTRAINT FK_DDS_Casualties_Local_Authority FOREIGN KEY ([Local_Authority_(District)])
    REFERENCES [Dim_Local_Authority_District]([ID]),

	CONSTRAINT FK_NDS_Casualties_Sex_of_Casualty FOREIGN KEY ([Sex_of_Casualty])
    REFERENCES [Dim_Sex_of_Casualty](ID_Sex_of_Casualty),

	CONSTRAINT FK_NDS_Casualties_Age_Band FOREIGN KEY ([Age_Band_of_Casualty])
    REFERENCES [Dim_Age_Band](ID_Age_Band),

	--CONSTRAINT FK_NDS_Casualties_Age_Band2 FOREIGN KEY ([Age_Band2])
    --REFERENCES [Dim_AgeBand2](BandKey),

	CONSTRAINT FK_NDS_Casualties_Casualty_Severity FOREIGN KEY ([Casualty_Severity])
    REFERENCES [Dim_Casualty_Severity](ID_Casualty_Severity),

	CONSTRAINT FK_NDS_Casualties_Casualty_Type FOREIGN KEY ([Casualty_Type])
    REFERENCES [Dim_Casualty_Type](ID_Casualty_Type)
)