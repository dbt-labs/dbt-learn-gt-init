with source as (

    select * from {{ source('jaffle_university', 'semesters') }}

),

renamed as (

    select
        id as semester_id,
        name as semester_name,
        start_date,
        end_date

    from source

)

select * from renamed
