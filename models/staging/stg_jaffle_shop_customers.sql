--stg_jaffle_shop__customers.sql

select
    *
from {{ source('jaffle_shop', 'customers') }}
