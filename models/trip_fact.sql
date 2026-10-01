WITH trips As (

    select
        ride_id,
        -- rideable_type,
        date(to_timestamp(STARTED_AT)) as trip_date,
        start_station_id,
        end_station_id,
        member_csual,
        datediff(second,to_timestamp(STARTED_AT),to_timestamp(EDNED_AT)) as trip_duration_seconds
    from {{ ref('stg_bike') }}
    where ride_id != 'ride_id'
    limit 10
)

select * from trips