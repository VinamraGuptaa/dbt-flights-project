with flights as (

    select * from {{ ref('stg_flights') }}

),

derived as (

    select
        flight_date,
        distance_miles,
        air_time_minutes,
        departure_delay,
        arrival_delay,
        departure_time_scheduled,
        arrival_time_scheduled,

        -- Total delay in minutes (departure + arrival delay)
        coalesce(departure_delay, 0) + coalesce(arrival_delay, 0) as total_delay_mins,

        -- Is Delayed flag → if either delay is > 0
        case
            when coalesce(departure_delay, 0) > 0 or coalesce(arrival_delay, 0) > 0 then 1
            else 0
        end as is_delayed

    from flights

)

select * from derived