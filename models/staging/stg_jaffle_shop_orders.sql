    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status

    from raw1_restored.jaffle_shop.orders