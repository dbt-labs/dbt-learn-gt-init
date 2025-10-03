
with grades_standardized as (
    select * from {{ ref('int_grades_standardized') }}
    ),
students as (
    select * from {{ ref('dim_students') }}
    ),
courses as (
    select * from {{ ref('dim_courses') }}
    ),
instructors as (
    select * from {{ ref('dim_instructors') }}
    )
select
    grades_standardized.enrollment_id,
    grades_standardized.student_id,
    students.student_first_name,
    students.student_last_name,
    grades_standardized.course_id,
    courses.course_title,
    instructors.instructor_id,
    instructors.instructor_first_name,
    instructors.instructor_last_name,
    grades_standardized.grade,
    grades_standardized.grade_points,
    courses.credits,
    grades_standardized.grade_points * courses.credits as quality_points,
    grades_standardized.grade_points is not null as is_graded
from grades_standardized
left join students on grades_standardized.student_id = students.student_id
left join courses on grades_standardized.course_id = courses.course_id
left join instructors on grades_standardized.instructor_id = instructors.instructor_id
