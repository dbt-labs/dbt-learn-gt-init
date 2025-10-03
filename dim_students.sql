-- dimension: students (final cleaned)
select
    student_id,
    first_name,
    last_name,
    email,
    birthdate,
    major_dept_id,
    enroll_date,
    status
from {{ ref('stg_students') }}
