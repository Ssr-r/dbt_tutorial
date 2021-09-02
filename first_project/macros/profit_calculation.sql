{% macro profit_calculation(price_col, discount_col, tax_col, cost_col) %}
	({{ price_col }} + {{ tax_col }} - {{ discount_col }} - {{ cost_col }})::numeric(16,2)
{% endmacro %}
