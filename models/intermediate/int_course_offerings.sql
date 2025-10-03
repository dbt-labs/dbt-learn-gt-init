-- intermediate: enrich courses with instructor and semester-level aggregates
with enrollments as (
   select * from {{ ref('stg_jaffle_university__enrollments') }}
    ),

courses as (
    select * from {{ ref('stg_jaffle_university__courses') }}
    ),

offerings as (
    select
        enrollments.course_id,
        enrollments.semester_id,
        count(distinct enrollments.instructor_id) as num_instructors,
        count(enrollments.enrollment_id) as seats_taken,
        avg(enrollments.credits) as avg_credits
    from  enrollments
    group by 1,2
)

select
    offerings.course_id,
    offerings.semester_id,
    courses.course_title,
    courses.dept_id,
    courses.credits as course_default_credits,
    offerings.num_instructors,
    offerings.seats_taken,
    round(offerings.avg_credits,2) as avg_credits
from offerings
left join courses using (course_id)
