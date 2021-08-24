SELECT
	company,
	store_id,
	item_id,
	order_id,
	created_at,
	status
	increment_id,
	sku,
	--discount order_batches ana verisinde mevcut dict seklinde
	qty_ordered,
	price,
	base_cost,
	tax_percent,
	discount_amount
FROM sales_order_item
