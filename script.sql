use warehousesdb;

# Запрос №1 
select
products.product,
sum(qty) as quantity
from coming c 
inner join products on c.com_product_id = products.id
where com_warehouse_id=2 and date(c.coming_time) between '2022-02-01' and '2022-07-31'
group by products.product
order by products.product;

# Запрос №2 
select
products.product,
sum(qty) as quantity,
action_time
from expense e 
inner join products on e.ex_product_id = products.id
where ex_warehouse_id=3 and date(action_time) between  '2022-09-01' and '2022-09-30'
group by products.product
order by products.product;

# запрос №3
select 
categories.category ,
sum(qty) as quantity
from coming c
inner join products on c.com_product_id = products.id
inner join categories on products.category_id= categories.id
where com_warehouse_id = 2 and date(c.coming_time) between '2022-02-01' and '2022-07-31'
group by categories.category
order by categories.category;

# запрос №4
select 
b.brand,
sum(qty) as quantity
from coming c
inner join products on c.com_product_id = products.id
left join brands b on products.brand_id= b.id
where com_warehouse_id = 2 and date(c.coming_time) between '2022-02-01' and '2022-07-31'
group by b.brand
order by b.brand;

# запрос №6
select 
products.product,
sum(qty) as quantity
from coming c 
inner join products on c.com_product_id = products.id
where com_supplier_id = 1 and date(c.coming_time) between '2022-01-01' and '2022-03-31'
group by products.product
order by products.product;

# запрос №7
select 
products.product,
sum(qty) as quantity
from coming c 
inner join products on c.com_product_id = products.id
where com_supplier_id = 1 and com_warehouse_id = 2 and date(c.coming_time) between '2022-01-01' and '2022-07-31'
group by products.product
order by products.product;

# запрос №8
select 
products.product,
sum(qty) as quantity
from expense e 
inner join products on e.ex_product_id = products.id
where ex_supplier_id = 3 and ex_warehouse_id = 3 and date(action_time) between '2022-09-01' and '2022-09-30'
group by products.product
order by products.product;

# запрос №9
select 
s.supplier,
sum(qty) as quantity
from coming c 
inner join products p on c.com_product_id = p.id
inner join suppliers s on c.com_supplier_id = s.id
where com_product_id=9 and date(coming_time) between '2022-01-01' and '2022-09-30'
group by s.supplier, p.product
order by quantity desc;

# запрос №10
select 
s.supplier,
sum(qty) as quantity
from expense e 
inner join products p on e.ex_product_id = p.id
inner join suppliers s on e.ex_supplier_id = s.id
where ex_product_id=2 and date(action_time) between  '2022-01-01' and '2022-09-30'
group by s.supplier, p.product
order by quantity desc;
