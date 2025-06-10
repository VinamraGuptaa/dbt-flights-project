{{ config(materialized='table') }}

with flight_metrics as (

    select * from {{ ref('int_flight_metrics') }}

)

select
    flight_date,
    distance_miles,
    air_time_minutes as flight_duration_mins,  -- rename for consistency
    departure_delay,
    arrival_delay,
    total_delay_mins,
    is_delayed

from flight_metrics
