WITH orders AS (
    SELECT
        created_at :: DATE,
        site_id,
        SUM(price) AS total_price,
        SUM(cost) AS total_cost,
        SUM(discount) AS total_discount,
        SUM(tax) AS total_tax,
        SUM(profit) AS total_profit,
        COUNT(DISTINCT increment_id) AS total_order,
        SUM(quantity) AS total_quantity
    FROM {{ ref('fct_orders') }}
    GROUP BY 1,2
)

SELECT * FROM orders