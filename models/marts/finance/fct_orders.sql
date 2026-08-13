with orders as (
    select * from {{ ref('stg_jaffle_shop__orders') }}
),

customers as (
    select * from {{ ref('stg_jaffle_shop__customers') }}
),

payments as (
    select * from {{ ref('stg_stripe__payments') }}
),

order_payments as (
    select
        order_id,
        sum(case when status = 'succes' then amount end) as amount
    from payments
    group by order_id
)

select
    orders.order_id,
    orders.customer_id,
    orders.order_date,
    coalesce(order_payments.amount,0) as amount

from orders
left join order_payments using (order_id)
