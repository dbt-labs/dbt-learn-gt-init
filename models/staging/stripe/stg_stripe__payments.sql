select 
    id,
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    amount/100 as amount,
    created

from {{ source('stripe', 'payment') }}
