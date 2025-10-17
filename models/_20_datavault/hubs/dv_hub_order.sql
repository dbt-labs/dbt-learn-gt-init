select 
md5(order_id) as order_hkey 

from {{ ref('stg_src_jfl__orders') }}