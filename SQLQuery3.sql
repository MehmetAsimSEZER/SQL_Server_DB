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
		[BrandId] INT IDENTITY (1,1) PRIMARY KEY,
		[Name] NVARCHAR (25) NOT NULL,

)

alter table Brand add OriginId int;
alter table Brand add foreign key(OriginId) references Origin(OriginId);

insert Brand (Name) values ('AUDI')
insert Brand (Name) values ('BMW')
insert Brand (Name) values ('Chevrolet')
insert Brand (Name) values ('Citroen')
insert Brand (Name) values ('Dodge')
insert Brand (Name) values ('Ford')
insert Brand (Name) values ('Ferrari')
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



update Brand set OriginId = 1 where Name = 'AUDI';
update brand set originid = 1 where name in ('BMW','Volkswagen','Porche'); 
update brand set originid = (select originId from Origin where Country='France') where name in ('Peugeot','Renault','Citroen','Opel')
update Brand set OriginId = 1 where Name ='Mercedes';
update Brand set OriginId = 1 where Name in ('Seat','Skoda');
update Brand set OriginId = (select OriginId from Origin where Country='USA')WHERE NAME in ('Ford','Chevrolet','Dodge')
update Brand set OriginId = 4 where Name = 'Honda';
update Brand set OriginId = 3 where Name = 'Ferrari';
update Brand set OriginId = 6 where Name = 'LandRover';

select * from Brand



create table [dbo].[Vehicle]
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

create	table [dbo].[ModelSpec]
(
		[ModelSpecId] INT IDENTITY (1,1) PRIMARY KEY,
		[ModelName] NVARCHAR (30) NOT NULL,

)


alter table ModelSpec add BrandId int;
alter table ModelSpec add Foreign key (BrandId) References Brand(BrandId); 


alter table ModelSpec add VehicleId int;
alter table ModelSpec add Foreign key (VehicleId) References Vehicle(VehicleId); 


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


update ModelSpec set BrandId = (select BrandId from Brand where name = 'Mercedes') where ModelName in ('A180','A200','C180','C200','E200','E250','E350','S400','S500','S580','G63','X250');
update ModelSpec set BrandId = (select BrandId from Brand where name = 'Audı')  where ModelName in ('A3','A4','A5','A6','A7','A8','A8L','Q5','Q7','SQ7','RS5','RS6','RS7','RSQ8');
update ModelSpec set BrandId = (select BrandId from Brand where name = 'Bmw') where ModelName in ('3.20','4.20','5.20','5.30','7.45','8.50','M3','M5','M6','M8');
update ModelSpec set BrandId = (select BrandId from Brand where name = 'Peugeot') where ModelName in ('208','308','508','2008','3008','5008');
update ModelSpec set BrandId = (select BrandId from Brand where name = 'Porche') where ModelName in ('911','Panamera','Cayanne');
update ModelSpec set BrandId = (select BrandId from Brand where name = 'Volkswagen') where ModelName in ('Arteon','Passat','Golf','Polo');
update ModelSpec set BrandId = (select BrandId from Brand where name = 'Opel') where ModelName in ('Insignia','Astra','Corsa');
update ModelSpec set BrandId = (select BrandId from Brand where name = 'Citroen') where ModelName in ('C3','C4','C5','C3Aircross','C5Aircross');
update ModelSpec set BrandId = (select BrandId from Brand where name = 'Renault') where ModelName in ('Talisman','Megane','Clio');
update ModelSpec set BrandId = (select BrandId from Brand where name = 'Ford') where ModelName in ('Focus','Mustang');
update ModelSpec set BrandId = (select BrandId from Brand where name = 'Chevrolet') where ModelName in ('CamaroSS','Cruze');
update ModelSpec set BrandId = (select BrandId from Brand where name = 'Dodge') where ModelName in ('Charger','Challenger');
update ModelSpec set BrandId = (select BrandId from Brand where name = 'Honda') where ModelName in ('Civic','Accord');
update ModelSpec set BrandId = (select BrandId from Brand where name = 'Seat') where ModelName in ('Ibiza','Leon');
update ModelSpec set BrandId = (select BrandId from Brand where name = 'Skoda') where ModelName in ('Superb','Octavia');
update ModelSpec set BrandId = (select BrandId from Brand where name = 'Ferrari') where ModelName in ('SF90','F8','Roma');
update ModelSpec set BrandId = (select BrandId from Brand where name = 'LandRover') where ModelName in ('Discovery','Defender','RangeRover');



update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Suv') where ModelName in ('Discovery','Defender','RangeRover');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Sedan') where ModelName in ('Superb','Octavia');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Coupe') where ModelName in ('CamaroSS');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Sedan') where ModelName in ('Cruze');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Sedan') where ModelName in ('Charger');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Coupe') where ModelName in ('Challenger');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Coupe') where ModelName in ('Mustang');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Sedan') where ModelName in ('Focus');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Sedan') where ModelName in ('Civic','Accord');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Hatchback') where ModelName in ('Ibiza','Leon');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Sedan') where ModelName in ('Talisman','Megane');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Hatchback') where ModelName in ('Clio');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Hatchback') where ModelName in ('C3','C4');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Sedan') where ModelName in ('C5');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Suv') where ModelName in ('C3Aircross','C5Aircross');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Sedan') where ModelName in ('Insignia','Astra');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Hatchback') where ModelName in ('Corsa');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Suv') where ModelName in ('2008','3008','5008');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Hatchback') where ModelName in ('208','308');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Sedan') where ModelName in ('508');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Station') where ModelName in ('Panamera');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Suv') where ModelName in ('Cayanne');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Sedan') where ModelName in ('Arteon','Passat');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Hatchback') where ModelName in ('Golf','Polo');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Sedan') where ModelName in ('3.20','4.20','5.20','5.30','7.45','8.50')
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Coupe') where ModelName in ('M3','M5','M6','M8');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Suv') where ModelName in ('Q5','Q7','SQ7','RSQ8');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Sedan') where ModelName in ('A4','A5','A6','A7','A8','A8L')
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Sedan') where ModelName in ('A200','C180','C200','E200','E250','E350','S400','S500','S580')
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Hatchback') where ModelName in ('A180','A3');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Suv') where ModelName in ('G63','X250');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Station') where ModelName in ('RS6');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Coupe') where ModelName in ('RS5');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Sedan') where ModelName in ('RS7');
update ModelSpec set VehicleId = (select VehicleId from Vehicle where Type = 'Sport') where ModelName in ('911','SF90','F8','Roma');



insert ModelSpec (ModelName,BrandId,VehicleId) values ('A180',9,2);
insert ModelSpec (ModelName,BrandId,VehicleId) values ('Focus',6,5);



select * from ModelSpec;



select Name,ModelName,Type,Country from ModelSpec m 
inner join Brand b
on m.BrandId = b.BrandId
inner join Origin o
on o.OriginId = b.OriginId
inner join Vehicle v
on v.VehicleId = m.VehicleId
where Type = 'Sedan'









