{{config(
    materialized='incremental',
    unique_key='order_id',
    incremental_strategy='merge'
)}}

WITH stripe_payments AS (
    SELECT 
        order_id,
        payment_status,
        SUM(payment_amount) AS payment_amount
    FROM {{ref('stg_stripe__payments')}}
    WHERE payment_status = 'success'
    GROUP BY 1,2
),

jaffle_orders AS (
    SELECT 
        order_id,
        customer_id,
        order_date,
        order_status
    FROM {{ref('stg_jaffle_shop__orders')}}
)

SELECT 
    o.order_id,
    o.customer_id,
    o.order_date,
    sp.payment_amount,
    sp.payment_status
FROM jaffle_orders o
LEFT JOIN stripe_payments sp
    ON o.order_id = sp.order_id
{% if is_incremental() %}
WHERE o.order_date >= (SELECT MAX(order_date) FROM {{ this }})
{% endif %}