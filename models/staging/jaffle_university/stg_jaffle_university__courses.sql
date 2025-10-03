with source as (

    select * from {{ source('jaffle_university', 'courses') }}

),

renamed as (

    select
        id as course_id,
        code as course_code,
        title as course_title,
        dept_id,
        credits

    from source

)

select * from renamed
