--Müşteri bilgilerini isim sıralamasına göre liste halinde getiren sp 
go
CREATE PROCEDURE sp_CustomersList
	AS
		begin
			select first_name,
				   last_name,
				   street,
				   city,
				   state
			from sales.customers
			order by first_name asc
		end
go

execute sp_CustomersList

--Verilen kategori bilgisine göre ilgili kategori altındaki ürünleri, fiyata göre azalan şekilde sıralayan sp
go
CREATE PROCEDURE sp_Category(@categoryId int)
	AS
		begin
			select c.category_name,
				   p.product_name,
				   p.list_price
			from production.products p
			inner join production.categories c
			on p.category_id  = c.category_id
			where c.category_id = @categoryId
			order by p.list_price asc
		end
go

execute sp_Category @categoryId =6

--İki tarih arası siparişleri getiren sp
go
CREATE PROCEDURE sp_GetOrderItemsDate (@Date1 datetime, @Date2 datetime)
	AS
		begin
			select * 
			from sales.order_items	od
			inner join sales.orders o
			on od.order_id = o.order_id
			where order_date between @Date1 and @Date2
		end
go

execute sp_GetOrderItemsDate '01/01/2016','01/02/2016'

--Çalışanın adına göre yapmış olduğu satışları hesaplayan sp
go
CREATE PROCEDURE sp_GetStaffSales (@firstname varchar(20))
	AS
		begin
			select s.first_name,
				   SUM(od.quantity) as [Total Quantity],
				   SUM(od.quantity*od.list_price*(1-od.discount)) as [Total Amount]
			from sales.order_items od
			inner join sales.orders o
			on o.order_id = od.order_id
			inner join sales.staffs	s
			on o.staff_id = s.staff_id
			group by s.first_name
			having s.first_name = @firstname
		end
go

execute sp_GetStaffSales 'Mireya'

