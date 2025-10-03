with source as (

    select * from {{ source('jaffle_university', 'departments') }}

),

renamed as (

    select
        id as department_id,
        name as department_name

    from source

)

select * from renamed
