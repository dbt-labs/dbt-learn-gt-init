with 

source as (

    select * from {{ source('stripe', 'payment') }}

),

renamed as (

    select
        {{ cents_to_dollars('amount') }} as amount_usd,
        created,
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        _batched_at


    from source

)

select * from renamed
