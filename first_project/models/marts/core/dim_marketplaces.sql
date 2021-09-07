WITH marketplaces as (
    SELECT
        marketplace_id,
        marketplace_name
    FROM {{ ref('stg_orchestra_marketplaces') }}
)

SELECT * FROM marketplaces