with 

source as (

    select * from {{ source('jaffle_shop', 'customers') }}

),

renamed as (

    select
        id,
        trim(first_name) as first_name,
        upper(trim(last_name)) as last_name, 
        first_name || ' ' || last_name as full_name

    from source

)

select * from renamed