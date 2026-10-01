WITH CTE AS (
    select 
        STARTED_AT,
        DATE(to_timestamp(STARTED_AT)) as DATE_STARTED_AT,
        hour(to_timestamp(STARTED_AT)) as Hour_STARTED_AT,

        {{day_type('STARTED_AT')}} AS DAY_TYPE,
        
        {{get_season('STARTED_AT')}} as STATION_OF_YEAR

    from
    {{ ref('stg_bike') }}
    where STARTED_AT != 'started_at'
    ORDER BY STARTED_AT DESC

)

select * from CTE