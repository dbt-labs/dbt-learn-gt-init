
select
    md5(order_id) as order_hkey
    ,md5(customer_id) as customer_hkey
    ,order_date
from {{ ref('stg_src_jfl__orders') }}

