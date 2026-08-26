
with orders as (

    select * from {{ref('stg_jaffle_shop__orders')}}

),


payments as (
    
    select * from {{ref('stg_stripe__payments')}}
    where payment_status <> 'fail'
),




final as (

    select
        orders.order_id,
        orders.customer_id,
        payments.amount,
        orders.order_date,
        orders.order_status

    from orders

    left join payments using (order_id)

)

select * from final
