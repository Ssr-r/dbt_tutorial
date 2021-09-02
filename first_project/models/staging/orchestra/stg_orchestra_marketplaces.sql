WITH merchants AS (
    SELECT
        id AS marketplace_id,
        seo,
        name AS marketplace_name,
        tax_no,
        tax_company,
        public_name,
        email,
        mobile_phone,
        payment_duration,
        free_shipping_limit,
        allow_custom_attributes,
        allow_catalog_insert,
        address,
        commission,
        refund_duration,
        is_internal
    -- orkestra.merchants
    FROM {{ source('orchestra', 'merchant_table') }}
)

SELECT * FROM merchants