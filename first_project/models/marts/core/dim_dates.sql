WITH dates as (
    SELECT
        date_id,
        day_of_week,
        day_number,
        month_number,
        month_name,
        year_number,
        quarter,
        week_number,
        weekday_indicator
    FROM {{ ref('stg_orchestra_static_date_utils') }}
)

SELECT * FROM dates