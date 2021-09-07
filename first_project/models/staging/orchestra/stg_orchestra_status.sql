WITH status AS (
    SELECT
        id,
        name
    FROM {{ source('orchestra', 'status_table') }}
)

SELECT * FROM status