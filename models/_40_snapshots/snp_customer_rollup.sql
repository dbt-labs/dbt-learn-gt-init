select
    a.customer_hkey,
    a.first_name,
    a.last_name,
    a.full_name,
    b.first_order_date,
    b.most_recent_order_date,
    b.number_of_orders
from {{ ref('dm_dim_customer') }} a
left outer join {{ ref('dm_fct_customer') }} b on a.customer_hkey = b.customer_hkey