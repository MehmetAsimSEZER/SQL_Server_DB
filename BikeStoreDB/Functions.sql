--Ürünün kdv'li fiyatını hesaplayan fonksiyon
go
CREATE FUNCTION KDVHESAPLA(@fiyat money)
	RETURNS MONEY
		begin
			return @fiyat * 1.08
		end
go	

select p.product_name,
	   p.list_price,
	   dbo.KDVHESAPLA(list_price) as [KDV'li Fiyat]
from production.products p
join production.categories c on p.category_id = c.category_id

--Verilen personel Id'sine göre ilgili personelin bilgilerini getiren fonksiyon
go
CREATE FUNCTION GetStaffInfo(@staffId int)
RETURNS TABLE 
	RETURN select staff_id,
	              first_name,
				  last_name,
				  email,
				  phone
		   from sales.staffs
		   where staff_id = @staffId
go

select * from GetStaffInfo(3)

--Product Id'si verilen ürünün liste bilgilerini getiren fonksiyon
go
CREATE FUNCTION  GetProductInfo(@productId int)
	RETURNS TABLE
		RETURN select product_id,
					  product_name,
					  model_year,
					  list_price
			   from production.products
			   where product_id = @productId
go

select * from  GetProductInfo (15)

--Belirtilen stok miktarları arasında ürünlerin ürünleri filtreleyen fonksiyon 
go
CREATE FUNCTION StockControl(@min int, @max int)
	RETURNS TABLE 
		RETURN select p.product_id,
					  p.product_name,
					  p.list_price,
					  s.quantity
				from production.products p
				inner join production.stocks s
				on p.product_id = s.product_id
				where quantity between @min and @max
go

select * from StockControl (10,20)

--Kategorilere göre 100 adetten fazla satılan ürün miktarını gösteren fonksiyon
go
CREATE FUNCTION SatılanUrun(@SatısMiktari int)
	RETURNS TABLE 
		RETURN select c.category_name,
					  sum(od.quantity)	as [satılan ürün adedi]
				from production.products p 
				inner join sales.order_items od 
				on p.product_id = od.product_id
				inner join production.categories c 
				on c.category_id = p.category_id
				group by c.category_name
				having sum(od.quantity) > @SatısMiktari
go

select * from SatılanUrun(100)

--Verilen kategori bilgisine göre satılan ürün adedi ve toplam satış tutarını hesaplayan fonksiyon
go
CREATE FUNCTION CategoryInfo(@Category varchar(20))
	RETURNS TABLE 
		RETURN select c.category_name,
					  sum(od.quantity)	as [satılan ürün adedi],
					  (CAST(SUM(od.quantity*od.list_price*(1-od.discount)) as decimal)) as [Total Sales]
				from production.products p 
				inner join sales.order_items od 
				on p.product_id = od.product_id
				inner join production.categories c 
				on c.category_id = p.category_id
				group by c.category_name
				having c.category_name = @Category
go

select * from CategoryInfo('Mountain Bikes')






	