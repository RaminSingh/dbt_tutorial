{% macro format_amount(col_name) %}

    ({{col_name}})::numeric(16,2)

{% endmacro %}

{% macro format_quantity(col_name) %}
    ({{col_name}}):: type_numeric(6,0)
{% endmacro%}