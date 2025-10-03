-- fact: enrollments, joins dims and standardized grades
with g as (select * from {{ ref('int_grades_standardized') }}),
s as (select * from {{ ref('dim_students') }}),
c as (select * from {{ ref('dim_courses') }}),
i as (select * from {{ ref('dim_instructors') }})
select
    g.enrollment_id,
    g.student_id,
    s.first_name as student_first_name,
    s.last_name as student_last_name,
    g.course_id,
    c.title as course_title,
    g.instructor_id,
    i.first_name as instructor_first_name,
    i.last_name as instructor_last_name,
    g.grade,
    g.grade_points,
    c.credits,
    g.grade_points * c.credits as quality_points,
    g.grade_points is not null as is_graded
from g
left join s on g.student_id = s.student_id
left join c on g.course_id = c.course_id
left join i on g.instructor_id = i.instructor_id
