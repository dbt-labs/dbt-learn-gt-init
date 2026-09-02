select
    id as payment_id,
    orderid as order_id,
    amount / 100 as amount,
    paymentmethod as payment_method,
    status as payment_status,
    created as created_at,
    _batched_at

from {{ source('stripe', 'payment') }}


