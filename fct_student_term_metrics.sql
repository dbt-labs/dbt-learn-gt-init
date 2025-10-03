-- fact: student-term level metrics using intermediate aggregates
select
    student_id,
    semester_id,
    courses_taken,
    credits_taken,
    gpa_estimate
from {{ ref('int_student_term_aggregates') }}
