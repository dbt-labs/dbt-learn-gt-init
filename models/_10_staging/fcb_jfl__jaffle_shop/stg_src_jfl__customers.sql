select
    id as customer_id,
    first_name,
    last_name

from {{ source('_src_fcb_jfl', 'customers') }}