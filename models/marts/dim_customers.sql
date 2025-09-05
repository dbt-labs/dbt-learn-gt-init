with customers as (
    select customer_id, first_name, last_name
    from {{ ref('stg_jaffle_shop__customers') }}
),
orders as (
    select order_id, customer_id, order_date, status
    from {{ ref('stg_jaffle_shop__orders') }}
),
customer_orders as (
    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders
    from orders
    group by 1
),
final as (
    select
        c.customer_id,
        c.first_name,
        c.last_name,
        co.first_order_date,
        co.most_recent_order_date,
        coalesce(co.number_of_orders, 0) as number_of_orders
    from customers c
    left join customer_orders co using (customer_id)
)
select * from final;
