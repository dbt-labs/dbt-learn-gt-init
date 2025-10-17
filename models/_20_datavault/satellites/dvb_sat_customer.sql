select
    md5(customer_id) as customer_hkey,
    first_name,
    last_name,
    first_name || ' ' || last_name as full_name
from {{ ref('dvr_sat_fcb_jfl_customers') }}