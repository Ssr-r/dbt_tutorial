SELECT 
	company,
	entity_id,
	increment_id,
	created_at,
	updated_at,
	status,
	channel_name,
	customer_id,
	customer_email,
	customer_is_guest,
	customer_firstname,
	coupon_code,
	applied_rule_ids,
	rule_id,
	shipping_description,
	total_qty_ordered
--orkestra.order_batches
FROM sales_order