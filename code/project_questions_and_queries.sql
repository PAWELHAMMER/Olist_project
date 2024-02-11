-- There are some spelling mistake in olist_products table, let's fix it:

alter table olist_products 
rename column product_description_lenght to product_description_length

alter table olist_products
rename column product_name_lenght to product_name_length

select product_name_length, product_description_length
from olist_products

-- 1) What is the number of rows in each table?

select count(pr.*) as products_count,
count(oi.*) as order_items_count,
count(ord.*) as orders_count,
count(op.*) as payments_count
from olist_products pr
join olist_order_items oi
	on pr.product_id = oi.product_id
join olist_orders ord
	on oi.order_id = ord.order_id
join olist_order_payments op
	on oi.order_id = op.order_id

/* 2)What was the preferred method of payment in Olist?
(!) To check that, we must first change some data in the table:
the site is from Brasil, so some of the data is in Portuguese */

update olist_order_payments
set payment_type = 'ticket'
where payment_type = 'boleto'

select
	count(case when payment_type = 'ticket' then 1 end) as tickets,
	count(case when payment_type = 'credit_card' then 1 end) as credit_card,
	count(case when payment_type = 'voucher' then 1 end) as vouchers
from olist_order_payments

/* 3) What was the expected interval between purchasing an item and receiving it? 
List only the orders that haven't reached the customer. */

select ord.product_id, ord.price, pr.product_photos_qty
from olist_order_items ord
join olist_products pr
	on ord.product_id = pr.product_id
order by ord.price desc
limit 10
select order_id, 
(order_estimated_delivery_date - order_purchase) as expected_time,
order_status
from olist_orders
where order_status != 'delivered'
order by expected_time desc

-- 4) List the top 10 most expensive products. How many photos of them were listed?

select ord.product_id, ord.price, pr.product_photos_qty
from olist_order_items ord
join olist_products pr
	on ord.product_id = pr.product_id
order by ord.price desc
limit 10

-- 5)What was the sum of and average payment value of orders that reached customers in 2017 and 2018?

select ex.year_delivered, 
sum(payment_value) as sum_of_payments,
avg(payment_value) as average_value_of_payments
from 
(select extract(year from ord.order_delivered_customer_date) as year_delivered,
ord.order_id,
py.payment_value
from olist_orders ord
join olist_order_payments py
	on ord.order_id = py.order_id) ex
	where year_delivered is not NULL
group by ex.year_delivered

/* 6) List the products that have shipping limit date before December of the year 2017.
Include their parameters and list their sellers. */

with product_parameters as(
	select product_id, product_height_cm, product_length_cm, product_weight_g, product_width_cm
	from olist_products)
select pp.*,
oi.seller_id,
cast((shipping_limit_date) as date)
from product_parameters pp
join olist_order_items oi
	on pp.product_id = oi.product_id
	and shipping_limit_date < '2017-12-01'

/* 7) List only the products that are higher than 15 centimeters, weigh more than 15 grams 
and are wider than 40 grams. List them by month of their shipping. */

with months as (select extract(month from shipping_limit_date) as months, product_id 
			from olist_order_items)
select mon.* ,
op.product_id, op.product_height_cm, op.product_length_cm, op.product_width_cm
from months mon
join olist_products op
	on op.product_id = mon.product_id
where product_height_cm > 15
	and product_weight_g > 15 
	and product_width_cm >40
order by 1 asc

/* 8) List the orders that were aprroved at 2nd of Februray, April or October of 2011.
Include the id of sellers*/

select ord. order_id,ord.seller_id, 
oo.order_approved_at
from olist_order_items ord
join olist_orders oo
	on ord.order_id = oo.order_id
where order_approved_at = 
	(select cast(order_approved_at as date)
	from olist_orders
	where order_approved_at in ('2017-10-02', '2017-04-02', '2017-07-02'))


/* 9) List the orders that have been delivered to the customers. 
Include the time that passed between between purchasing and delivering product to the customer.
Present the data in a way that shows the list in a consecutive manner and  */

with time_interval as (
				select (order_delivered_customer_date - order_purchase) as purchase_to_delivery, 
				order_id
				from olist_orders
				where order_delivered_customer_date is not null)
select
row_number() over 
(partition by oo.order_status order by ti.purchase_to_delivery) as ord_row,
oo.order_id, oo.order_status, ti.purchase_to_delivery,
dense_rank() over 
(partition by oo.order_status order by ti.purchase_to_delivery) as ord_dense_rank
from olist_orders oo
join time_interval ti
	on oo.order_id = ti.order_id
	
/* -- 10) Using product specifications, create a list that shows what packagings are needed for which day.
There are four types of packages:
- short and high
- short and low
- long and high
- long and low
How many packagings of each type were needed according to the limit each day between December 2017 and May 2018?
Then return the days and number of short and low packagings when there was a day in which they were needed.*/

select sub. shipping_limit_date,
sub.short_and_low from
(select
oi.shipping_limit_date::date,
	sum(case when op.product_length_cm < 50 
		and op.product_height_cm > 15 then 1 else 0 end) 
		as short_and_high,
	sum(case when op.product_length_cm < 50 
		and op.product_height_cm <= 15 then 1 else 0 end)
		as short_and_low,
	sum(case when op.product_length_cm >= 50 
		and op.product_height_cm > 15 then 1 else 0 end)
		as long_and_high,
	sum(case when op.product_length_cm >= 50 
		and op.product_height_cm <= 15 then 1 else 0 end)
		as long_and_low
from olist_products op
join olist_order_items oi
	on oi.product_id = op.product_id
where shipping_limit_date > '2017-12-31' 
	and shipping_limit_date < '2018-05-01'
group by oi.shipping_limit_date) sub
where short_and_low != '0'

