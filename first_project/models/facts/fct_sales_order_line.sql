SELECT
	soi.id,
	TO_CHAR(so.created_at :: DATE, 'yyyyMMdd') as date_id,
	pt.id as platform_id,
	soi.sku,
	so.increment_id,
	so.discounts,
	soi.price,
	soi.cost,
	soi.discount_amount as discount,
	soi.tax_amount as tax,
	(soi.price + soi.tax_amount-soi.discount_amount - soi.cost) as profit,
	1 as quantity
FROM
    date_table as dt,
    order_batches as so,
    order_lines as soi,
    platform_table as pt
WHERE
	EXTRACT(YEAR FROM so.created_at) = dt.year_number
	AND EXTRACT(MONTH FROM so.created_at) = dt.month_number
	AND EXTRACT(DAY FROM so.created_at) = dt.day_number
	AND pt.company_id = CAST(soi.site_id AS TEXT)
	AND pt.channel_id = CAST(so.channel_id AS TEXT)
	AND so.id = CAST(soi.order_batch_id AS TEXT)
