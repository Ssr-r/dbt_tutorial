WITH customer_ as (
    SELECT
        id,
        created_at,
        updated_at,
        name,
        middle_name,
        last_name,
        email,
        dob,
        gender,
        is_active
    FROM {{ref('stg_customer')}}
),
order_ AS (
    SELECT
        customer_email,
        MAX(created_at) as max_date,
        MIN(updated_at) as min_date,
        COUNT(DISTINCT increment_id) as order_count
    FROM {{ref('stg_sales_order')}}
    GROUP BY 1

)
SELECT * FROM customer_ LEFT JOIN order_ ON order_.customer_email = customer_.email