WITH daily_weather AS (

    select 
        date(time) as daily_weather_val,
        weather,
        temp,
        pressure,
        humidity,
        clouds
    from 
    {{ source('demo', 'weather') }}
),
daily_weather_agg as (

    select
        daily_weather_val,
        weather,
        count(weather) as weather_val,
        round(avg(temp),2) as avg_temp,
        round(avg(pressure),2) as avg_pressure,
        round(avg(humidity),2) as avg_humidity,
        round(avg(clouds),2) as avg_clouds
        -- row_number() over(partition by daily_weather_val order by weather_val desc) as row_number
    from
    daily_weather
    group by daily_weather_val,weather 
    -- order by weather_val desc
    qualify row_number() over(partition by daily_weather_val order by weather_val desc) = 1
)

select 
*
from daily_weather_agg 