with 

source as (

    select * from {{ source('jaffle_shop', 'orders') }}

),

renamed as (

    select

    from source

)

select * from renamed
