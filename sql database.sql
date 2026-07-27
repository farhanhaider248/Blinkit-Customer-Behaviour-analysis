create database blinkit_customer_behaviour;
use blinkit_customer_behaviour;
-- 1 total customers
select * from blinkit_customer_behaviour;
SELECT count(customer_id) as total_customers FROM blinkit_customer_behaviour.blinkit;
-- 2 total revenue
select sum(purchase_amount) as total_revenue from blinkit_customer_behaviour.blinkit;
-- 3 average purchase amount
select avg(purchase_amount) as avg_purchase from blinkit_customer_behaviour.blinkit;
-- 4 highest purchase amount
select purchase_amount from blinkit_customer_behaviour.blinkit order by purchase_amount desc limit 1;
-- 5 lowest purchase
select purchase_amount from blinkit_customer_behaviour.blinkit order by purchase_amount limit 1;
-- 6 avg age
select avg(age) as avg_age from blinkit_customer_behaviour.blinkit;
-- 7 male vs female count
select gender, count(customer_id) as total_count from blinkit_customer_behaviour.blinkit group by gender;
-- 8 total cities
select city from blinkit_customer_behaviour.blinkit group by city;
-- 9. total categories
select category from blinkit_customer_behaviour.blinkit group by category;
-- 10. total products
select item_purchased as total_products from blinkit_customer_behaviour.blinkit group by item_purchased;
-- 11 revenue by city 
select city, sum(purchase_amount) as total_revenue from blinkit_customer_behaviour.blinkit group by city;
-- 12 revenue by gender
select gender, sum(purchase_amount) as revenue_by_gender from blinkit_customer_behaviour.blinkit group by gender;
-- 13 revenue by category
select category, sum(purchase_amount) as revenue_by_category from blinkit_customer_behaviour.blinkit group by category;
-- 14 revenue by month
select purchase_month, sum(purchase_amount) as revenue_by_month from blinkit_customer_behaviour.blinkit group by purchase_month;
-- 15 revenue by day
select purchase_day, sum(purchase_amount) as revenue_by_day from blinkit_customer_behaviour.blinkit group by purchase_day;
-- 16 revenue by payment method
select payment_method, sum(purchase_amount) as revenue_by_paymentmethod from blinkit_customer_behaviour.blinkit group by payment_method;
-- 17 revenue by subscription
select subscription, sum(purchase_amount) as revenue_by_subscription from blinkit_customer_behaviour.blinkit group by subscription;
-- 18 top 10 customer
select customer_id, sum(purchase_amount) as top_10_customers from blinkit_customer_behaviour.blinkit
group by customer_id order by customer_id desc limit 10;
-- 19 top 10 products
select item_purchased, sum(purchase_amount) as top_10_products from blinkit_customer_behaviour.blinkit
group by item_purchased order by item_purchased desc limit 10;
-- 20 top categories
select category, sum(purchase_amount) as top_categories from blinkit_customer_behaviour.blinkit
group by category order by category desc;
-- 21 discount percentage
select round(sum(discount_flag) * 100/ count(*),2) as discount_percentage from blinkit_customer_behaviour.blinkit;
-- 22 avg purchase by gender
select gender, avg(purchase_amount) as avg_purchase from blinkit_customer_behaviour.blinkit group by gender;
-- 23 avg purchase by city
select city, avg(purchase_amount) as avg_purchase from blinkit_customer_behaviour.blinkit group by city;
-- 24 most used paynent method 
select payment_method, sum(purchase_amount) as avg_purchase from blinkit_customer_behaviour.blinkit
group by payment_method order by payment_method desc limit 1;
-- 25 most purchased product 
select item_purchased, sum(purchase_amount) from blinkit_customer_behaviour.blinkit
group by item_purchased order by item_purchased desc limit 1;
-- 26 highest spending customer
select customer_id, sum(purchase_amount) from blinkit_customer_behaviour.blinkit
group by customer_id order by customer_id desc limit 1;
-- 27 Second Highest Spending Customer
select customer_id,customer_name, sum(purchase_amount) from blinkit_customer_behaviour.blinkit
group by customer_id,customer_name order by customer_id desc limit 1 offset 1; 
-- 28 top 5 discounted product
select item_purchased, round(sum(discount_flag)* 100,2) as discount_percentage
from blinkit_customer_behaviour.blinkit group by item_purchased order by discount_percentage
desc limit 5;
-- 29 discount vs non discount revenue
select discount_applied, sum(purchase_amount) as revenue from blinkit_customer_behaviour.blinkit
group by discount_applied order by revenue desc;
-- 30 revenue by age group
select age_group, sum(purchase_amount) as purchase_am from blinkit_customer_behaviour.blinkit
group by age_group order by purchase_am desc ;
-- 31 revenue by revenue segment
select revenue_segment, sum(purchase_amount) as total_revenue from blinkit_customer_behaviour.blinkit
group by revenue_segment order by total_revenue;
-- 32 customer spending above avg
select customer_id, purchase_amount from blinkit_customer_behaviour.blinkit
where purchase_amount > ( select avg(purchase_amount) from blinkit_customer_behaviour.blinkit)
order by purchase_amount desc;
-- 33 customer spending below avg
select customer_id, purchase_amount from blinkit_customer_behaviour.blinkit
where purchase_amount < ( select avg(purchase_amount) from blinkit_customer_behaviour.blinkit)
order by purchase_amount desc;
-- 34 repeat products
select item_purchased, count(*) as total_purchase from blinkit_customer_behaviour.blinkit
group by item_purchased having count(*) > 1 order by total_purchase desc;
-- 35 product purchased only 1.
select item_purchased, count(*) as total_purchase from blinkit_customer_behaviour.blinkit
group by item_purchased having count(*) = 1 order by total_purchase desc;
-- 36 running revenue 
select customer_id, customer_name, purchase_date, purchase_amount,sum(purchase_amount)
over ( order by purchase_date, customer_id) as running_revenue from blinkit_customer_behaviour.blinkit;
-- 37 customer ranking
select customer_id, customer_name, purchase_amount, dense_rank() over( order by purchase_amount desc)
as customer_ranking from blinkit_customer_behaviour.blinkit;
-- 38 category ranking
select category,sum(purchase_amount) as total_revenue, dense_rank() over(order by 
sum(purchase_amount) desc) as category_ranking from blinkit_customer_behaviour.blinkit 
group by category;
-- 39 monthly growth
select purchase_month, sum(purchase_amount) as monthly_revenue from blinkit_customer_behaviour.blinkit
group by purchase_month order by min(purchase_date);
-- 40 top revenue city
select city, sum(purchase_amount) as revenue from blinkit_customer_behaviour.blinkit group by city
order by revenue desc limit 1;