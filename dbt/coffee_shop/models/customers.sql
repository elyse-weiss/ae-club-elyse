{{ config(
    materialized='table'
 ) }}

select c.id as customer_id 
, c.name 
, c.email  
, count(*) as orders 
, min(created_at) as first_order_at
from `analytics-engineers-club.coffee_shop.customers` c
left join `analytics-engineers-club.coffee_shop.orders` o on c.id=o.customer_id
group by 1, 2, 3
order by first_order_at 