with source as (

    select * from {{ source('jaffle_university', 'students') }}

),

renamed as (

    select
        id as student_id,
        first_name as student_first_name,
        last_name as student_last_name,
        email,
        birthdate,
        major_dept_id,
        enroll_date,
        status

    from source

)

select * from renamed
