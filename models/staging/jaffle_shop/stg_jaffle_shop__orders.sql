    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status as order_status,
        _etl_loaded_at
        
    from {{ source('jaffle_shop', 'orders') }}