-- dimension: instructors
with instructors as (
    select * from {{ ref('stg_jaffle_university__instructors') }}
    ) 
select
    instructor_id,
    instructor_first_name,
    instructor_last_name,
    email,
    dept_id,
    title,
    hire_date
from instructors
