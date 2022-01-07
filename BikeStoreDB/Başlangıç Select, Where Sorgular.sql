select * from production.categories
select * from production.products
select * from production.stocks
select * from sales.customers
select * from sales.order_items
select * from sales.orders
select * from sales.staffs
select * from sales.stores

select * from production.brands
where brand_name = 'Electra'

select * from production.categories
where category_id = 6

select * from production.products
where list_price between 179.99 and 279.99

select * from production.stocks
where quantity <= 10

select * from sales.customers
where phone is null

select distinct street 
from sales.customers

select product_id,
	   list_price
from sales.order_items
order by list_price asc

select * from sales.orders
order by order_date desc

select * from sales.staffs
where first_name like '[A-Z]%'

select store_name,
	   phone,
	   city,
	   street
from sales.stores
where store_id in (1,2,3)

select first_name,
	   last_name,
	   email,
	   street
from sales.customers
where state = 'NY'
order by first_name asc


