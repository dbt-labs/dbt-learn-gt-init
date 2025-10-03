-- intermediate: per student per semester aggregates
with se as (
    select student_id, semester_id, count(enrollment_id) as courses_taken, sum(credits) as credits_taken,
           avg(case when grade in ('A','A-','B+','B') then 4 when grade in ('B-','C+','C') then 2 when grade in ('C-','D') then 1 when grade='F' then 0 else null end) as gpa_estimate
    from {{ ref('stg_enrollments') }}
    group by student_id, semester_id
)
select s.student_id, s.first_name, s.last_name, se.semester_id, se.courses_taken, se.credits_taken, round(se.gpa_estimate,2) as gpa_estimate
from {{ ref('stg_students') }} s
left join se using (student_id)
