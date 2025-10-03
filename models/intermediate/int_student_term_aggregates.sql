-- intermediate: per student per semester aggregates

with enrollments as (
        select * from {{ ref('stg_jaffle_university__enrollments') }}
    ),
    students as (
        select * from {{ ref('stg_jaffle_university__students') }}
    ),
    
student_grades as (
    select 
        student_id, 
        semester_id, 
        count(enrollment_id) as courses_taken, 
        sum(credits) as credits_taken,
        avg(case 
            when grade in ('A','A-','B+','B') then 4 
            when grade in ('B-','C+','C') then 2 
            when grade in ('C-','D') then 1 
            when grade='F' then 0 
        else null end) as gpa_estimate
    from enrollments
    group by student_id, semester_id
)
select 
    students.student_id, 
    students.student_first_name,
    students.student_last_name, 
    student_grades.semester_id, 
    student_grades.courses_taken, 
    student_grades.credits_taken, 
    round(student_grades.gpa_estimate,2) as gpa_estimate
from students
left join student_grades using (student_id)
