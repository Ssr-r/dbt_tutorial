WITH campaigns AS (
    SELECT
        id AS campaign_id,
        name AS campaign_name,
        campaign_type,
        conditions,
        actions,
        discount_amount,
        max_discount_qty,
        discount_step,
        discount_qty,
        start_date as start_date_ts,
        end_date as end_date_ts,
        --UNIXTODATE(start_date) as start_date_fmt -- eklenece unix->fmt
        --UNIXTODATE(end_date) as end_date_fmt -- eklenece unix->fmt
        status,
        description,
        uses_per_customer,
        stop_rules_processing,
        coupon_type,
        customer_groups,
        times_used,
        usage_limit,
        discount_to_fixed_price,
        site_id,
        condition_minimum_qty,
        label,
        specific_coupon_code,
        specific_coupon_id,
        generate_coupon_qty,
        generate_code_length,
        generate_code_prefix,
        use_auto_generation,
        priority,
        is_free_delivery
        use_price,
        dynamic_badge_id,
        updated_at
    --orkestra.basket_campaigns
    FROM {{ source('orchestra', 'campaigns_table') }}
)

SELECT * FROM campaigns