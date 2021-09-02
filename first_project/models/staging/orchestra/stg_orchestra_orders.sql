WITH order_batches AS (
    SELECT
        id AS order_id,
        increment_id,
        TO_CHAR(created_at :: DATE, 'yyyyMMdd') AS date_id,
        applied_rule_ids,
        CONCAT(site_id :: TEXT, COALESCE(customer_id :: TEXT, 'Non-Member')) AS customer_id,
        channel_id :: TEXT,
        site_id :: TEXT,
        CONCAT(channel_id, site_id, '1') AS platform_id,
        customer_email,
        status,
        coupon_code,
        discounts,
        COALESCE(created_at, updated_at) AS created_at
    FROM {{ source('orchestra', 'order_batches') }}
),

order_lines AS (
    SELECT
        order_batch_id :: TEXT,
        merchant_id,
        sku,
        price,
        cost,
        discount_amount AS discount,
        tax_amount AS tax,
        {{ profit_calculation('price', 'discount_amount', 'tax_amount', 'cost') }} AS profit,
        1 as quantity,
        updated_at
    FROM {{ source('orchestra', 'order_lines')}}
),

final_orders AS (
    SELECT
        order_lines.order_batch_id,
        order_lines.merchant_id,
        order_lines.sku,
        order_lines.price,
        order_lines.cost,
        order_lines.discount,
        order_lines.tax,
        order_lines.profit,
        order_lines.quantity,
        order_batches.*,
        order_lines.updated_at
    FROM order_lines LEFT JOIN order_batches ON order_batches.order_id = order_lines.order_batch_id
)

SELECT * FROM final_orders
