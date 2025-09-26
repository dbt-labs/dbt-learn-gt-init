with 

source as (

    select * from {{ source('jaffle_shop', 'order_items') }}

),

renamed as (

    select
        order_item_id,
        order_id,
        product_id,
        ordered_at,
        product_name,
        product_price,
        is_food_item,
        is_drink_item,
        supply_cost

    from source

)

select * from renamed
