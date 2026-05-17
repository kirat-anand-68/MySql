select * from `TARGET_SQL.Customer`;

select * from `TARGET_SQL.Geo_Location` limit 5;

# get the time range btween which the order were placed
select 
min(order_purchase_timestamp) as start_time,
max(order_purchase_timestamp) as end_time
from `TARGET_SQL.Orders`;
# details of the customer who have order during the given timestamp
select c.customer_city,c.customer_state
from `TARGET_SQL.Orders` as 
o join `TARGET_SQL.Customer` as c
on o.customer_id=c.customer_id
where extract(YEAR from o.order_purchase_timestamp)=2018
and extract(month from order_purchase_timestamp) between 1 and 3;

# growing trend in the no. of orders placed over the past year

select
extract(month from order_purchase_timestamp) as month,
count(order_id) as order_num
from `TARGET_SQL.Orders`
group by month
order by order_num desc;


select
extract(hour from order_purchase_timestamp) as time,
count(order_id) as order_num
from `TARGET_SQL.Orders`
group by extract(hour from order_purchase_timestamp)
order by order_num desc;

select 
extract(month from order_purchase_timestamp) as month,
extract(year from order_purchase_timestamp) as year,
count(*) as num_orders
from `TARGET_SQL.Orders`
Group by year,month
order by year,month;

# Distribution of customers acroos the states of brazil

select customer_city,customer_state,
count(distinct customer_id) as customer_count
from `TARGET_SQL.Customer`
group by customer_city,customer_state
order by customer_count desc;

( with yearly_totals as (
select
extract (year from o.order_purchase_timestamp) as year,
sum(p.payment_value) as total_payment
from `TARGET_SQL.Payments` as p join
`TARGET_SQL.Orders` as o on
p.order_id=o.order_id
where extract (year from o.order_purchase_timestamp) in(2017,2018) and extract(month from o.order_purchase_timestamp)between 1 and 8
group by extract (year from o.order_purchase_timestamp)),

yearly_comparisons as(
select year,
total_payment, lead(total_payment) over (order by year desc) as prev_year_payment from yearly_totals)


select 
round(((total_payment-prev_year_payment)/ prev_year_payment)*100,2)
from yearly_comparisons
);


# mean and sum of price and freight by customer state
select
c.customer_state,
avg(price) as avg_price,
sum(price) as sum_price,
avg(freight_value) as avg_freight,
sum(freight_value) as sum_freight
from `TARGET_SQL.Orders` as o join `TARGET_SQL.Order_Items` as oi on o.order_id=oi.order_id
join `TARGET_SQL.Customer` as c on o.customer_id=c.customer_id
group by c.customer_state;


# calculate the days between purchasing the order delivering the order and estimated delivery.

select order_id,
date_diff(date(order_delivered_customer_date), date(order_purchase_timestamp), DAY) as days_to_delivery,

date_diff(date(order_delivered_customer_date), date(order_estimated_delivery_date), DAY) as diff_estimated_delivery
from `TARGET_SQL.Orders`;

# select out the top 5 states with the highest & the lowest average freight value

select c.customer_state,
avg(freight_value) as avg_freight_value
from `TARGET_SQL.Orders` as o
join `TARGET_SQL.Order_Items` as oi 
on o.order_id=oi.order_id
join `TARGET_SQL.Customer` as c 
on o.customer_id=c.customer_id
group by customer_state
order by avg_freight_value desc
limit 5;


#  find out the top 5 states with the highest and the lowest average delivery time.

select c.customer_state,
avg(extract(date from o.order_delivered_customer_date)-extract(date from o.order_purchase_timestamp)) as avg_time_to_delivery
from `TARGET_SQL.Orders` as o
join `TARGET_SQL.Order_Items` as oi 
on o.order_id=oi.order_id
join `TARGET_SQL.Customer` as c 
on o.customer_id=c.customer_id
group by customer_state
order by avg_time_to_delivery desc
limit 5;

# find the month on month no.of orders placed using the different payment types

select 
payment_type,
extract( YEAR from order_purchase_timestamp) as year,
extract( MONTH from order_purchase_timestamp) as month,
count(distinct o.order_id) as order_count
from `TARGET_SQL.Orders` as o
inner join `TARGET_SQL.Payments` as p
on o.order_id=p.order_id
group by payment_type,year,month
order by payment_type,year,month;

# find the number of payments instalmnets based on number of paymnets installments

select payment_installments,
count(distinct order_id) as num_orders
from `TARGET_SQL.Payments`
group by payment_installments



