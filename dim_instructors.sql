-- dimension: instructors
select
    instructor_id,
    first_name,
    last_name,
    email,
    dept_id,
    title,
    hire_date
from {{ ref('stg_instructors') }}
