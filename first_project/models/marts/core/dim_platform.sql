SELECT
	id,
	company,
	channel,
	version
FROM {{ref('stg_platform')}}
