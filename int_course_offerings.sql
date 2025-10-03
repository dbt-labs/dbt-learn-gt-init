-- intermediate: enrich courses with instructor and semester-level aggregates
with offerings as (
    select
        e.course_id,
        e.semester_id,
        count(distinct e.instructor_id) as num_instructors,
        count(e.enrollment_id) as seats_taken,
        avg(e.credits) as avg_credits
    from {{ ref('stg_enrollments') }} e
    group by 1,2
),
course_meta as (
    select c.* from {{ ref('stg_courses') }} c
)
select
    o.course_id,
    o.semester_id,
    cm.title,
    cm.dept_id,
    cm.credits as course_default_credits,
    o.num_instructors,
    o.seats_taken,
    round(o.avg_credits,2) as avg_credits
from offerings o
left join course_meta cm using (course_id)
