--Ürünleri fiyatlarıyla getiren join sorgu
select p.product_name,
	   p.model_year,
	   o.list_price
from production.products p
inner join sales.order_items o
on o.product_id = p.product_id

--Personellerin hangi mağazada çalıştığını getiren join sorgu
select s.first_name,
	   s.last_name,
	   sa.store_name,
	   sa.state
from sales.staffs s
inner join sales.stores sa
on s.store_id = sa.store_id

--Mağazalara göre stok miktarını getiren join sorgu
select s.store_id,
	   s.store_name,
	   SUM(p.quantity) as [total stock]
from sales.stores s
inner join production.stocks p
on p.store_id = s.store_id
group by s.store_id,s.store_name  

--Ürünleri isimlerine göre satış adedi ve satış tutarı olarak filtreleyen join sorgu
select p.product_name,
	   od.quantity,
	   SUM(od.quantity*od.list_price*(1-od.discount)) as [total amount]
from sales.customers c
inner join sales.orders o
on c.customer_id = o.customer_id
inner join sales.order_items od
on od.order_id = o.order_id
inner join production.products p
on p.product_id = od.product_id
group by p.product_name,od.quantity

--Ürünlerin isimlerine göre hangi tarihte hangi fiyattan satıldığını, sipariş ve kargo tarihini müşteri bilgileriyle filtreleyen join sorgu
select p.product_name,
	   p.model_year,
	   (od.quantity*od.list_price*(1-od.discount)) as [total amount],
	   o.order_date,
	   o.shipped_date,
	   c.first_name+' '+c.last_name as [Full Name],
	   c.street,
	   c.city
from production.products p
inner join sales.order_items od
on p.product_id = od.product_id
inner join sales.orders o
on o.order_id =od.order_id
inner join sales.customers c
on c.customer_id = o.customer_id
																			  
--Kategorilerine göre ürünlerin stok miktarını hesaplayan join sorgu
select c.category_name,
	   SUM(s.quantity) as [total stock]
from production.categories c
inner join production.products p
on c.category_id = p.category_id
inner join production.stocks s
on s.product_id = p.product_id
group by c.category_name
order by [total stock] asc

--Personellerin toplam yapmış olduğu satış adedi ve toplam satışların tutarını gösteren join sorgu
select st.first_name,
	   st.last_name,
	   SUM(od.quantity) as [total quantity],
	   cast(SUM(od.quantity*od.list_price*(1-od.discount)) as decimal) as [total amount],
	   s.store_name
from sales.staffs st
inner join sales.stores s
on st.store_id = s.store_id
inner join sales.orders o
on o.store_id =s.store_id
inner join sales.order_items od
on od.order_id = o.order_id
group by st.first_name,st.last_name,s.store_name
having SUM(od.quantity) >= 1000
order by [total amount] desc

--Müşterilerin isimleriyle birlikte almış olduğu ürünlerin, hangi mağazadan, hangi çalışan tarafından, kategorilerine göre adet ve fiyatlarının
--Sipariş tarihi, kargo tarihi ve teslimat adresinin filtrelendiği multiple join sorgu
select cu.first_name+' '+cu.last_name as [Customer Name],
	   p.product_name,
	   p.model_year,
	   c.category_name,
	   (od.quantity*od.list_price*(1-od.discount)) as [Total Amount],
	   st.store_name,
	   stf.first_name+' '+stf.last_name as [Staff Name],
	   o.order_date,
	   o.shipped_date,
	   cu.street+' '+cu.city+' '+cu.state as [Customer Adress]
from production.brands b
inner join production.products p
on b.brand_id = p.brand_id
inner join production.categories c
on c.category_id = p.category_id
inner join production.stocks s
on s.product_id = p.product_id
inner join sales.stores st
on st.store_id = s.store_id 
inner join sales.staffs stf
on stf.store_id = st.store_id
inner join sales.orders o
on o.staff_id =stf.staff_id
inner join sales.customers cu
on cu.customer_id = o.customer_id
inner join sales.order_items od
on od.order_id = o.order_id
order by [Customer Name] asc,
		 [Total Amount] asc



