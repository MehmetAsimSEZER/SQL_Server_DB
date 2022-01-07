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


CREATE TABLE [dbo].[Brand]
(
		[BrandId] INT IDENTITY (1,1) PRIMARY KEY,
		[Name] NVARCHAR (25) NOT NULL,
		[OriginId] INT NOT NULL,
		CONSTRAINT [FK_Brand_OriginId] FOREIGN KEY ([OriginId]) REFERENCES [dbo].[Origin]([OriginId])
)


insert Brand (Name,OriginId) values ('AUDI',1)
insert Brand (Name,OriginId) values ('BMW',1)
insert Brand (Name,OriginId) values ('Chevrolet',5)
insert Brand (Name,OriginId) values ('Citroen',2)
insert Brand (Name,OriginId) values ('Dodge',5)
insert Brand (Name,OriginId) values ('Ford',5)
insert Brand (Name,OriginId) values ('Ferrari',3)
insert Brand (Name,OriginId) values ('Honda',4)
insert Brand (Name,OriginId) values ('Mercedes',1)
insert Brand (Name,OriginId) values ('Opel',2)
insert Brand (Name,OriginId) values ('Peugeot',2)
insert Brand (Name,OriginId) values ('Porche',1)
insert Brand (Name,OriginId) values ('Renault',2)
insert Brand (Name,OriginId) values ('Seat',1)
insert Brand (Name,OriginId) values ('Skoda',1)
insert Brand (Name,OriginId) values ('Volkswagen',1)
insert Brand (Name,OriginId) values ('LandRover',6)



select * from Brand



CREATE TABLE [dbo].[Vehicle]
(
		[VehicleId] INT IDENTITY (1,1) PRIMARY KEY,
		[Type] NVARCHAR (25) NOT NULL,
		
)


insert Vehicle (Type) values ('suv');	
insert Vehicle (Type) values ('sedan');
insert Vehicle (Type) values ('coupe');
insert Vehicle (Type) values ('station');
insert Vehicle (Type) values ('hatchback');
insert Vehicle (Type) values ('sport');


select * from Vehicle;



CREATE TABLE [dbo].[ModelSpec]
(
		[ModelSpecId] INT IDENTITY (1,1) PRIMARY KEY,
		[ModelName] NVARCHAR (30) NOT NULL,
		[BrandId] INT NOT NULL,
		[VehicleId] INT NOT NULL,
		CONSTRAINT [FK_ModelSpec_BrandId] FOREIGN KEY ([BrandId]) REFERENCES [dbo].[Brand]([BrandId]),
		CONSTRAINT [FK_ModelSpec_VehicleId]	FOREIGN KEY ([VehicleId]) REFERENCES [dbo].[Vehicle]([VehicleId])

)


insert ModelSpec (ModelName,BrandId,VehicleId) values ('A180',9,5);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('A200',9,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('C180',9,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('C200',9,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('E200',9,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('E250',9,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('E350',9,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('S400',9,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('S500',9,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('S580',9,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('G63',9,1);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('X250',9,1);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('A3',1,5);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('A4',1,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('A5',1,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('A6',1,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('A7',1,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('A8',1,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('A8L',1,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Q5',1,1);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Q7',1,1);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('SQ7',1,1);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('RS5',1,3);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('RS6',1,4);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('RS7',1,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('RSQ8',1,1);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('3.20',2,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('4.20',2,3);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('5.20',2,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('5.30',2,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('7.45',2,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('8.50',2,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('M3',2,3);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('M5',2,3);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('M6',2,3);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('M8',2,3);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('911',12,6);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Panamera',12,4);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Cayanne',12,1);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Arteon',16,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Passat',16,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Golf',16,5);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Polo',16,5);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('208',11,5);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('308',11,5);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('508',11,5);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('2008',11,1);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('3008',11,1);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('5008',11,1);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Insignia',10,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Astra',10,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Corsa',10,5);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('C3',4,5);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('C4',4,5);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('C5',4,5);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('C3Aircross',4,1);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('C5Aircross',4,1);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Talisman',13,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Megane',13,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Clio',13,5);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Focus',6,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Mustang',6,3);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('CamaroSS',3,3);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Cruze',3,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Charger',5,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Challenger',5,3);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Civic',8,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Accord',8,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Leon',14,5);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Ibıza',14,5);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Superb',15,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Octavia',15,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('SF90',7,6);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('F8',7,6);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Roma',7,6);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Discovery',17,1);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Defender',17,1);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('RangeRover',17,1);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('A180',9,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Focus',6,5);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('A3',1,2);	  



select * from ModelSpec;


select Name,ModelName,Type,Country from ModelSpec m 
inner join Brand b
on m.BrandId = b.BrandId
inner join Origin o
on o.OriginId = b.OriginId
inner join Vehicle v
on v.VehicleId = m.VehicleId






