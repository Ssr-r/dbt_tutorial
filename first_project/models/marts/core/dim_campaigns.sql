WITH campaigns as (
    SELECT
        campaign_id,
        campaign_name,
        campaign_type,
        discount_amount --ratio
    FROM {{ ref('stg_orchestra_campaigns') }}
)

SELECT * FROM campaigns