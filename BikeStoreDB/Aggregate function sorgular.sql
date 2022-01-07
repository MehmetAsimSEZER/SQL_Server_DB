select min (list_price) as [minimum fiyat]
from production.products

select max (list_price) as [ maximum fiyat] 
from production.products

select sum (list_price)  as [toplam tutar]
from production.products

select AVG(list_price) as [ortalama tutar] 
from production.products

select COUNT(*) as ürün 
from production.products 

select COUNT(first_name) as müşteri
from sales.customers

select category_id,
	   MIN(list_price) as [minimum fiyat]
from production.products
group by category_id 
order by [minimum fiyat]

select city,
	   state,
	   COUNT(*) as [sehir ve ülkeler]
from sales.customers
group by city,state
order by [sehir ve ülkeler]desc,
		 city asc

select category_id,
	   COUNT(*) as adet 
from production.products
group by category_id
having COUNT(*) >=10

select order_id,
	   COUNT(*) as total,
	   SUM((Quantity*list_price)*(1-Discount)) as [total amount]
from sales.order_items
group by order_id
having SUM((Quantity*list_price)*(1-Discount)) >1500

select category_id,
		COUNT(*) as [ürün sayısı],
		MAX (list_price) as [en yüksek fiyat],
		MAX (list_price) as [en düşük fiyat],
		AVG (list_price) as [ortalama fiyat],
		SUM (list_price) as [toplam fiyat]
from production.products
group by category_id
having SUM (list_price) >= 200 --max (Unitprice) <=100 --count(*) >=10 and CategoryID in (1,2,8)
order by [en yüksek fiyat],
		 [en düşük fiyat],
		 [ortalama fiyat],
		 [toplam fiyat]


select city,
		count(*) as [sehirler]
from sales.customers
where phone is null
group by city
having count(*) > 1
order by [sehirler] asc



