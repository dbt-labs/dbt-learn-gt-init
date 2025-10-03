-- intermediate: normalize grade notation and map to numeric scale
with enrollments as (
    select * from {{ ref('stg_jaffle_university__enrollments') }}
    )

select 
    enrollment_id, 
    student_id, 
    course_id,
    instructor_id, 
    grade,
    case
        when grade in ('A') then 4.0
        when grade in ('A-') then 3.7
        when grade in ('B+') then 3.3
        when grade in ('B') then 3.0
        when grade in ('B-') then 2.7
        when grade in ('C+') then 2.3
        when grade in ('C') then 2.0
        when grade in ('C-') then 1.7
        when grade in ('D') then 1.0
        when grade in ('F') then 0.0
        else null
    end as grade_points
    from enrollments
