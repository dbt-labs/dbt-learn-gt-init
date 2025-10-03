-- fact: student-term level metrics using intermediate aggregates
with metrics as (
    select * from {{ ref('int_student_term_aggregates') }}
    )

select
    student_id,
    semester_id,
    courses_taken,
    credits_taken,
    gpa_estimate
from metrics
