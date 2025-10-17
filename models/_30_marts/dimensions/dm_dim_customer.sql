select
    customer_hkey,
    first_name,
    last_name,
    full_name
from {{ ref('dvb_sat_customer') }}