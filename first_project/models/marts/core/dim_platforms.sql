WITH platforms as (
    SELECT
        *
    FROM {{ ref('stg_orchestra_platforms') }}
)

SELECT * FROM platforms