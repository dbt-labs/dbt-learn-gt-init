with 

source as (

    select * from {{ source('jaffle_shop', 'customers') }}

),

renamed as (

    select

    from source

)

select * from renamed
