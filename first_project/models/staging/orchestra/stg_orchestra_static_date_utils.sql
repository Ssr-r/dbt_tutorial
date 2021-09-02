WITH dates as (
    SELECT
        id as date_id,
        day_of_week,
        day_number,
        month_number,
        month_name,
        year_number,
        quarter,
        week_number,
        weekday_indicator
    FROM {{ source('orchestra', 'date_table') }}
)

SELECT * FROM dates