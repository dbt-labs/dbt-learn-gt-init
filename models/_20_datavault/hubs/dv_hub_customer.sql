select 
md5(customer_id) as customer_hkey 

from {{ ref('stg_src_jfl__customers') }}