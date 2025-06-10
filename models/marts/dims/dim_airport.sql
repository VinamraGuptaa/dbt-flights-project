{{ config(materialized='table') }}

with source as (

    select * from flights

),

renamed as (

    select
        FL_DATE            as flight_date,
     
        DEP_DELAY          as departure_delay,
        ARR_DELAY          as arrival_delay,
        AIR_TIME           as air_time_minutes,
        DISTANCE           as distance_miles,
        DEP_TIME           as departure_time_scheduled,
        ARR_TIME           as arrival_time_scheduled

    from source

)

select * from renamed
