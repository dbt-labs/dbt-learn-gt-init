 select
        
        count(user_id) as number_of_customers,
        order_date

    from raw.jaffle_shop.orders
    group by order_date