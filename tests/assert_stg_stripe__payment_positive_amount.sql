SELECT 
    order_id,
    SUM(payment_amount) AS total_amount
FROM {{ref('stg_stripe__payments')}}
GROUP BY 1
HAVING SUM(payment_amount) < 0