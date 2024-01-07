{% macro format_amount(col_name) %}

    ({{col_name}})::numeric(16,2)

{% endmacro %}