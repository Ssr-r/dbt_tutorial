SELECT
	campaign_id,
	campaign_name
FROM {{ ref('stg_orchestra_campaigns') }} -- Değişecek
