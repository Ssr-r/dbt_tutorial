WITH status as (
    SELECT
        id,
        name
    FROM {{ ref('stg_orchestra_status') }}
)

SELECT * FROM status