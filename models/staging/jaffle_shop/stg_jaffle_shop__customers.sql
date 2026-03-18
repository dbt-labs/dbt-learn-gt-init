with source as (
    select * from {{source('jaffle_shop', 'customers') }}
)

, transformation as (
    select 
        id as customer_id,
        first_name,
        last_name,
        first_name || ' ' || last_name as name
    from source
)

select * from transformation