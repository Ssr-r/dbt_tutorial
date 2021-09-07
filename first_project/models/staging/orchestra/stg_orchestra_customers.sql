WITH customers as (
    SELECT
        website_id::TEXT AS site_id,
        entity_id,
        CONCAT(website_id, entity_id) AS customer_id,
        created_at,
        updated_at,
        firstname AS first_name,
        middlename AS middle_name,
        lastname AS last_name,
        email AS customer_email,
        dob,
        gender,
        is_active
    FROM {{ source('orchestra', 'customer_entity') }}
)

SELECT * FROM customers