with 

source as (

    select * from {{ source('stripe', 'payment') }}

),

renamed as (

    select
        amount,
        created,
        id,
        orderid,
        paymentmethod,
        status,
        _batched_at


    from source

)

select * from renamed
