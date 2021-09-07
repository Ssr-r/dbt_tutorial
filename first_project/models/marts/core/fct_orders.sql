WITH orders AS (
    SELECT * FROM {{ ref('stg_orchestra_orders') }}
)

SELECT * FROM orders