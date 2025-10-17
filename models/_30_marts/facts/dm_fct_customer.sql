{{
    config(
        materialized='table'
    )
}}

with orders as (

    select
        a.order_hkey,
        b.customer_hkey,
        a.order_date,
        a.status

    from {{ ref('dvr_sat_fcb_jfl_orders') }} a
    left outer join {{ ref('dv_lnk_customer_order') }} b on a.order_hkey = b.order_hkey

)

select
    customer_hkey,
    min(order_date) as first_order_date,
    max(order_date) as most_recent_order_date,
    count(order_hkey) as number_of_orders

from orders
group by customer_hkey
