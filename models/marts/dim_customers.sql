with customers as 
(
    select * from {{ ref('stg_jaffle_shop__customers') }}
),
orders as 
(
    select * from {{ ref('stg_jaffle_shop__orders') }}
),
final as 
(
select
        c.customer_id,
        c.first_name,
        c.last_name,
        min(o.order_date) as First_Order_Date,
        max(o.order_date) as Most_Recent_Order_date,
        coalesce(count(o.order_id), 0) as number_of_orders

from customers c

left join orders o using (customer_id)
)

select * from final