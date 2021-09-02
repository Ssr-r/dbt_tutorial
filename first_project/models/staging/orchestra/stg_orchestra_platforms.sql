WITH platforms AS (
    SELECT
        id AS platform_id,
        company,
        company_id AS site_id,
        channel,
        channel_id,
        version
    FROM {{ source('orchestra', 'platform_table') }}
)

SELECT * FROM platforms