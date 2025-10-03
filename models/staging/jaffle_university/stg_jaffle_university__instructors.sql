

with source as (

    select * from {{ source('jaffle_university', 'instructors') }}

),

renamed as (

    select
        id as instructor_id,
        first_name as instructor_first_name,
        last_name as instructor_last_name,
        email,
        dept_id,
        hire_date,
        title

    from source

)

select * from renamed
