SELECT
	id,
	name,
	campaign_type,
	discount_amount --ratio
FROM {{ref('stg_campaign')}}
