select 
    id as customer_id,
    first_name,
    last_name
from from {{ source('jaffle_shop','customers')}}