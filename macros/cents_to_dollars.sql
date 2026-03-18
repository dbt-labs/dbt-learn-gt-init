{% macro cents_to_dollars(column_name, decimals=2) %}
        ROUND({{ column_name }} * 1.0 / 100, {{ decimals }})
{%- endmacro %}