WITH customers AS (
    SELECT
        site_id,
        customer_id,
        created_at,
        updated_at,
        first_name,
        middle_name,
        last_name,
        customer_email,
        dob,
        gender,
        is_active
    FROM {{ ref('stg_orchestra_customers') }}
),
orders AS (
    SELECT
        customer_id,
        MAX(created_at) AS max_date,
        MIN(created_at) AS min_date,
        COUNT(DISTINCT increment_id) AS order_count
    FROM {{ ref('stg_orchestra_orders') }}
    GROUP BY 1
),

final AS (
    SELECT
        customers.*,
        orders.max_date,
        orders.min_date,
        orders.order_count
    FROM customers LEFT JOIN orders ON orders.customer_id = customers.customer_id
)

SELECT * FROM final