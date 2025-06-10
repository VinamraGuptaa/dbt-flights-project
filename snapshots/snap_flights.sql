{% snapshot snap_flights %}

{{
    config(
      target_schema='snapshots',
      unique_key='concat(cast(flight_date as varchar), \'-\', cast(departure_time_scheduled as varchar), \'-\', cast(arrival_time_scheduled as varchar))',
      strategy='check',
      check_cols=['departure_delay', 'arrival_delay', 'air_time_minutes']
    )
}}

select * from {{ ref('stg_flights') }}

{% endsnapshot %}
