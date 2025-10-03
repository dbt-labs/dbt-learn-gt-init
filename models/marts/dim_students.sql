-- dimension: students (final cleaned)
with students as (
    select * from {{ ref('stg_jaffle_university__students') }}
)
select
    student_id,
    student_first_name,
    student_last_name,
    email,
    birthdate,
    major_dept_id,
    enroll_date,
    status
from students
