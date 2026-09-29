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
        count(weather)
    from
    daily_weather
    group by daily_weather_val,weather
)

select 
*
from daily_weather_agg