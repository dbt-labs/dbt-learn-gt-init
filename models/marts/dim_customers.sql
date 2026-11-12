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
    orders.order_id,
    orders.order_date,
    orders.status
from customers
join orders on customers.customer_id = orders.customer_id