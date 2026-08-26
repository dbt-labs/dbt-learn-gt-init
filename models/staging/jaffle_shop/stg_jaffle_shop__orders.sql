    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status as order_status

    from raw.jaffle_shop.orders