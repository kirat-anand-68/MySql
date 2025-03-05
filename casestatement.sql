select * from products

--eg->1-we need to add a column to categorised each product into the categories of high medium and low
select
* ,
case
	when Price > 500 then 'High'
	when Price>=500 and Price >=200 then 'Medium'
	else 'low'
end as [high/medium/low]
from products
-----------------------------------------------------------TEST
select
* ,
case
	when Price > 500 then 'High'
	when Price>=500 and Price >=200 then 'Medium'
	--else 'low'
end as [high/medium/low]
from products

--example2: provide priorit to each category and sort the data according to that priority

select * from products
order by
case
	when Category in ('Electronics') then 1
	when Category in ('Furniture') then 2
	else 3
end
-------------------------------------------------------test
select * from products
order by
case
	when Category in ('Electronics') then 1
	when Category in ('Furniture') then 2
	when Category ='Accessories' then 3
end

select * from products

--we need to group the data based on columns category and proice into different categories i.e affordable & premium
select 
* ,
case
	when Category='Electronics' then 
		case when Price>=300 then 'Premium Electronics'
		else 'Affordable Electronics'
		end
	when Category='Furniture' then
		case when price>=250 then 'Premium Furniture'
		else'Affordable Furniture'
		end
else 
		case when price >=25 then 'Premium Accesories'
		else 'Affordable Accessories'
		end
end as [Groups]
from products
-----------------------------------------------------------------TEst
select 
* ,
case
	when Category='Electronics' then 
		case when Price>=300 then 'Premium Electronics'
		else 'Affordable Electronics'
		end
	when Category='Furniture' then
		case when price>=250 then 'Premium Furniture'
		else'Affordable Furniture'
		end
	when Category in ('Accessories') then
		case when price >=25 then 'Premium Accesories'
		else 'Affordable Accessories'
		end
end as [Groups]
from products