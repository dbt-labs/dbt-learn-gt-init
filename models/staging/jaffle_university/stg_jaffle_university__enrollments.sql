with source as (

    select * from {{ source('jaffle_university', 'enrollments') }}

),

renamed as (

    select
        id as enrollment_id,
        student_id,
        course_id,
        instructor_id,
        semester_id,
        enroll_date,
        grade,
        credits

    from source

)

select * from renamed
