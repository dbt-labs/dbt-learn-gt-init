select
    sum(lifetime_value) as total_lifetime_value
from {{ ref('dim_customers') }};