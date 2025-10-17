select
    md5(customer_id) as customer_hkey,
    first_name,
    last_name
from {{ ref('stg_src_jfl__customers') }}