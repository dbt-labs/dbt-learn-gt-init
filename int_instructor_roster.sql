-- intermediate: instructor metrics per semester
with instr_enroll as (
    select
        instructor_id,
        semester_id,
        count(enrollment_id) as enrollments_taught,
        avg(case when grade in ('A','A-','B+','B') then 1 else 0 end) as pct_high_grades
    from {{ ref('stg_enrollments') }}
    group by instructor_id, semester_id
)
select
    i.instructor_id,
    i.first_name,
    i.last_name,
    ie.semester_id,
    coalesce(ie.enrollments_taught,0) as enrollments_taught,
    round(coalesce(ie.pct_high_grades,0),3) as pct_high_grades
from {{ ref('stg_instructors') }} i
left join instr_enroll ie on i.instructor_id = ie.instructor_id
