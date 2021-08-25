SELECT
	id,
	date,
	day_of_week,
	day_number,
	month_number,
	month_name,
	year_number,
	quarter,
	week_number,
	weekday_indicator
FROM {{ref('stg_date')}}
