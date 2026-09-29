{% macro get_season(param) %}

    CASE 
        WHEN MONTH(to_timestamp({{param}})) IN (12,1,2)
            THEN 'WINTER'
        WHEN MONTH(to_timestamp({{param}})) IN (3,4,5)
            THEN 'SPRING'
        WHEN MONTH(to_timestamp({{param}})) IN (6,7,8)
            THEN 'SUMMER'
        ELSE 'AUTUMN'
    END

    -- CASE 
    --     WHEN to_timestamp({{param}}) < CURRENT_DATE 
    --         THEN 'PAST'
    --     ELSE 
    --         'FUTURE'
    -- END


{% endmacro %}


{% macro day_type(param) %}

    CASE
        WHEN DAYNAME(TO_TIMESTAMP({{ param }})) IN ('Sat', 'Sun')
            THEN 'WEEKEND'
        ELSE 'BUSINESSDAY'
    END

{% endmacro %}

