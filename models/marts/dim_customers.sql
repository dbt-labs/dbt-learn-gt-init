with 
    customers as (
        select
            *
        from {{ ref('stg_jaffle_shop__customers') }} 
    ),

    orders as (
        select 
            *
        from {{ ref('stg_jaffle_shop__orders') }}
    )

select
    customers.customer_id,
    customers.full_name,
    count(*) as oorder_count,
    min(order_date) as first_order_date,
    max(order_date) as first_order_date
    
from customers
join orders on customers.customer_id = orders.customer_id
group by customers.customer_id, customers.full_name