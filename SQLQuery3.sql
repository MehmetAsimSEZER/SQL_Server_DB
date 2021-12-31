use StoreDB

CREATE TABLE [dbo].[Origin]
(
		[OriginId] INT IDENTITY (1,1) PRIMARY KEY,
		[Country] NVARCHAR (25) NOT NULL,
)
		
insert Origin (Country) values ('Germany')
insert Origin (Country) values ('France')
insert Origin (Country) values ('Italy')
insert Origin (Country) values ('Japan')
insert Origin (Country) values ('USA')
insert Origin (Country) values ('UK')


select * from Origin

create table [dbo].[Brand]
(
		[CarId] INT IDENTITY (1,1) PRIMARY KEY,
		[Name] NVARCHAR (25) NOT NULL,

)

insert Brand (Name) values ('AUDI')
insert Brand (Name) values ('BMW')
insert Brand (Name) values ('Chevrolet')
insert Brand (Name) values ('Citroen')
insert Brand (Name) values ('Dodge')
insert Brand (Name) values ('Ford')
insert Brand (Name) values ('Ferrari')
insert Brand (Name) values ('Ford')
insert Brand (Name) values ('Honda')
insert Brand (Name) values ('Mercedes')
insert Brand (Name) values ('Opel')
insert Brand (Name) values ('Peugeot')
insert Brand (Name) values ('Porche')
insert Brand (Name) values ('Renault')
insert Brand (Name) values ('Seat')
insert Brand (Name) values ('Skoda')
insert Brand (Name) values ('Volkswagen')
insert Brand (Name) values ('LandRover')


alter table Brand add OriginId int;
alter table Brand add foreign key(OriginId) references Origin(OriginId);





update Brand set OriginId = 1 where Name = 'AUDI';
update brand set originid=1 where name in ('BMW','Volkswagen','Porche'); 
update brand set originid = (select originId from Origin where Country='France') where name in ('Peugeot','Renault','Citroen','Opel')
update Brand set OriginId = 1 where Name ='Mercedes';
update Brand set OriginId = 1 where Name in ('Seat','Skoda');
update Brand set OriginId = (select OriginId from Origin where Country='USA')WHERE NAME in ('Ford','Chevrolet','Dodge')
update Brand set OriginId = 4 where Name = 'Honda';
update Brand set OriginId = 3 where Name = 'Ferrari';
update Brand set OriginId = 6 where Name = 'LandRover';
delete from Brand where CarId = 8;


create table [dbo].[Vehicle]
(
		[VehicleId] INT IDENTITY (1,1) PRIMARY KEY,
		[Type] NVARCHAR (25) NOT NULL,
		
)

select * from Vehicle;

insert Vehicle (Type) values ('suv');	
insert Vehicle (Type) values ('sedan');
insert Vehicle (Type) values ('coupe');
insert Vehicle (Type) values ('station');
insert Vehicle (Type) values ('hatchback');

create	table [dbo].[ModelSpec]
(
		[ModelSpecId] INT IDENTITY (1,1) PRIMARY KEY,
		[ModelName] NVARCHAR (30) NOT NULL,

)

alter table ModelSpec add Series NVARCHAR (30)

alter table ModelSpec drop column Series


insert ModelSpec (ModelName) values ('A180');	
insert ModelSpec (ModelName) values ('A200');
insert ModelSpec (ModelName) values ('C180');
insert ModelSpec (ModelName) values ('C200');
insert ModelSpec (ModelName) values ('E200');
insert ModelSpec (ModelName) values ('E250');
insert ModelSpec (ModelName) values ('E350');
insert ModelSpec (ModelName) values ('S400');
insert ModelSpec (ModelName) values ('S500');
insert ModelSpec (ModelName) values ('S580');
insert ModelSpec (ModelName) values ('G63');
insert ModelSpec (ModelName) values ('X250');
insert ModelSpec (ModelName) values ('A3');
insert ModelSpec (ModelName) values ('A4');
insert ModelSpec (ModelName) values ('A5');
insert ModelSpec (ModelName) values ('A6');
insert ModelSpec (ModelName) values ('A7');
insert ModelSpec (ModelName) values ('A8');
insert ModelSpec (ModelName) values ('A8L');
insert ModelSpec (ModelName) values ('Q5');
insert ModelSpec (ModelName) values ('Q7');
insert ModelSpec (ModelName) values ('SQ7');
insert ModelSpec (ModelName) values ('RS5');
insert ModelSpec (ModelName) values ('RS6');
insert ModelSpec (ModelName) values ('RS7');
insert ModelSpec (ModelName) values ('RSQ8');
insert ModelSpec (ModelName) values ('3.20');
insert ModelSpec (ModelName) values ('4.20');
insert ModelSpec (ModelName) values ('5.20');
insert ModelSpec (ModelName) values ('5.30');
insert ModelSpec (ModelName) values ('7.45');
insert ModelSpec (ModelName) values ('8.50');
insert ModelSpec (ModelName) values ('M3');
insert ModelSpec (ModelName) values ('M5');
insert ModelSpec (ModelName) values ('M6');
insert ModelSpec (ModelName) values ('M8');
insert ModelSpec (ModelName) values ('911');
insert ModelSpec (ModelName) values ('Panamera');
insert ModelSpec (ModelName) values ('Cayanne');
insert ModelSpec (ModelName) values ('Arteon');
insert ModelSpec (ModelName) values ('Passat');
insert ModelSpec (ModelName) values ('Golf');
insert ModelSpec (ModelName) values ('Polo');
insert ModelSpec (ModelName) values ('208');
insert ModelSpec (ModelName) values ('308');
insert ModelSpec (ModelName) values ('508');
insert ModelSpec (ModelName) values ('2008');
insert ModelSpec (ModelName) values ('3008');
insert ModelSpec (ModelName) values ('5008');
insert ModelSpec (ModelName) values ('Insignia');
insert ModelSpec (ModelName) values ('Astra');
insert ModelSpec (ModelName) values ('Corsa');
insert ModelSpec (ModelName) values ('C3');
insert ModelSpec (ModelName) values ('C4');
insert ModelSpec (ModelName) values ('C5');
insert ModelSpec (ModelName) values ('C3Aircross');
insert ModelSpec (ModelName) values ('C5Aircross');
insert ModelSpec (ModelName) values ('Talisman');
insert ModelSpec (ModelName) values ('Megane');
insert ModelSpec (ModelName) values ('Clio');
insert ModelSpec (ModelName) values ('Focus');
insert ModelSpec (ModelName) values ('Mustang');
insert ModelSpec (ModelName) values ('CamaroSS');
insert ModelSpec (ModelName) values ('Cruze');
insert ModelSpec (ModelName) values ('Charger');
insert ModelSpec (ModelName) values ('Challenger');
insert ModelSpec (ModelName) values ('Civic');
insert ModelSpec (ModelName) values ('Accord');
insert ModelSpec (ModelName) values ('Leon');
insert ModelSpec (ModelName) values ('Ibıza');
insert ModelSpec (ModelName) values ('Superb');
insert ModelSpec (ModelName) values ('Octavia');
insert ModelSpec (ModelName) values ('SF90');
insert ModelSpec (ModelName) values ('F8');
insert ModelSpec (ModelName) values ('Roma');
insert ModelSpec (ModelName) values ('Discovery');
insert ModelSpec (ModelName) values ('Defender');
insert ModelSpec (ModelName) values ('RangeRover');


select * from ModelSpec;

create table wheel
(
	wheelId int identity(1,1) primary key,
	inc int
)


select * from wheel

create	table [dbo].model
(
		modelId INT IDENTITY (1,1) PRIMARY KEY,
		vehicleId int NOT NULL,
		modelSpecId int NOT NULL,
		wheelId int
)



select *from model;

insert into model(vehicleId, modelSpecId, wheelId) values(2,3,4);
insert into model(vehicleId, modelSpecId, wheelId) values(2,3,5);
insert into model(vehicleId, modelSpecId, wheelId) values(2,2,4);
insert into model(vehicleId, modelSpecId, wheelId) values(2,6,4);


