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
        DEP_TIME           as departure_time_scheduled,  -- assuming it's scheduled dep time
        ARR_TIME           as arrival_time_scheduled    -- assuming it's scheduled arr time

    from source

)

select * from renamed