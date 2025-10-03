-- dimension: courses
select
    course_id,
    course_code,
    title,
    dept_id,
    credits
from {{ ref('stg_courses') }}
