select
    MD5(order_id) as order_hkey,
    order_date,
    status

from {{ ref('stg_src_jfl__orders') }}