with source as (

    select * from {{ source('stripe', 'payment') }}

),

transformation as (

    select
        id AS payment_id,
        orderid AS order_id,
        paymentmethod AS payment_method,
        status as payment_status,
        -- amount is stored in cents, convert it to dollars
        {{ cents_to_dollars('amount', 2) }} AS payment_amount,
        created as payment_created,
        _batched_at
    from source

)

select * from transformation