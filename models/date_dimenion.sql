WITH CTE AS (
    select 
        STARTED_AT,
        DATE(to_timestamp(STARTED_AT)) as DATE_STARTED_AT,
        hour(to_timestamp(STARTED_AT)) as Hour_STARTED_AT,
        CASE
            WHEN dayname(to_timestamp(STARTED_AT)) IN ('Sat','Sun')
            THEN 'WEEKEND'
            ELSE 'BUSINESSDAY'
        END AS DAY_TYPE,
        MONTH(to_timestamp(STARTED_AT))

    from
    {{ source('demo', 'bike') }}
    where STARTED_AT != 'started_at'

)

select * from CTE