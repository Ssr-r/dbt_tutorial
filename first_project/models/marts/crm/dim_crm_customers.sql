WITH customers AS (
    SELECT
       *,
        CASE WHEN min_date >= CURRENT_DATE + INTERVAL '-3 MONTH'  THEN 'active_new'
            WHEN max_date >= CURRENT_DATE + INTERVAL '-12 MONTH' THEN 'active_existing'
            WHEN max_date >= CURRENT_DATE + INTERVAL '-18 MONTH' AND max_date < CURRENT_DATE + INTERVAL '-12 MONTH' THEN 'silent'
            WHEN max_date >= CURRENT_DATE + INTERVAL '-19 MONTH' AND max_date < CURRENT_DATE + INTERVAL '-18 MONTH' THEN 'new_churn'
            WHEN max_date < CURRENT_DATE + INTERVAL '-19 MONTH' THEN 'dorm_churn'
        ELSE '' END AS buyer_segment
    FROM  {{ ref('dim_customers')}}
)

SELECT * FROM customers