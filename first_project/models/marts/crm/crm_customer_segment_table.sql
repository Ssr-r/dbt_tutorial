WITH orders AS (
    SELECT
        site_id,
        channel_id,
        COUNT(DISTINCT(customer_email)) :: NUMERIC(16,2) AS total_customer,
        COUNT(DISTINCT(increment_id)) :: NUMERIC(16,2) AS total_order,
        SUM(quantity) :: NUMERIC AS total_quantity,
        (SUM(price) + SUM(tax) - SUM(discount)) :: NUMERIC(16,2) AS total_revenue,
        SUM(profit) :: NUMERIC(16,2) AS total_profit,
        SUM(profit) / (SUM(price) + SUM(tax) - SUM(discount)) :: NUMERIC(16,2) AS profit_rate,
        COUNT(DISTINCT(increment_id)) / COUNT(DISTINCT(customer_email)) :: NUMERIC(16,2) AS order_per_customer,
        SUM(profit) / COUNT(DISTINCT(customer_email)) :: NUMERIC(16,2) AS profit_per_customer,
        SUM(quantity) / COUNT(DISTINCT(increment_id)) :: NUMERIC(16,2) AS basket_size,
        (SUM(price) + SUM(tax) - SUM(discount)) / COUNT(DISTINCT(increment_id)) :: NUMERIC(16,2) AS basket_revenue
    FROM {{ ref('fct_orders') }}
    WHERE site_id IS NOT NULL
    GROUP BY 1, 2
)

SELECT * FROM orders