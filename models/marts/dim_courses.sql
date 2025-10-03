with courses as (
    select * from {{ ref('stg_jaffle_university__courses') }}
    )
select
    course_id,
    course_code,
    course_title,
    dept_id,
    credits
from courses
