with bike as (
    select 
        RIDE_ID,
        replace(STARTED_AT,'"','') as STARTED_AT,
        replace(ENDED_AT,'"','') as EDNED_AT,
        START_STATION_NAME,
        START_STATION_ID,
        END_STATION_NAME,
        END_STATION_ID,
        START_LAT,
        START_LNG,
        END_LAT,
        END_LGN,
        MEMBER_CSUAL

    FROM {{ source('demo', 'bike') }}

    WHERE RIDE_ID != '"bikeid"' and STARTED_AT != '"starttime"' and STARTED_AT != '"starttime"'
)
SELECT * FROM BIKE 