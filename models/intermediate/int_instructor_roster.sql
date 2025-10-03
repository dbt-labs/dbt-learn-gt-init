-- intermediate: instructor metrics per semester
with enrollments as (
        select * from {{ ref('stg_jaffle_university__enrollments') }}
    ),
    instructors as (
        select * from {{ ref('stg_jaffle_university__instructors') }}
    ),
instr_enroll as (
    select
        instructor_id,
        semester_id,
        count(enrollment_id) as enrollments_taught,
        avg(case when grade in ('A','A-','B+','B') then 1 else 0 end) as pct_high_grades
    from enrollments
    group by instructor_id, semester_id
)
select
    instructors.instructor_id,
    instructors.instructor_first_name,
    instructors.instructor_last_name,
    instr_enroll.semester_id,
    coalesce(instr_enroll.enrollments_taught,0) as enrollments_taught,
    round(coalesce(instr_enroll.pct_high_grades,0),3) as pct_high_grades
from  instructors
left join instr_enroll on instructors.instructor_id = instr_enroll.instructor_id
