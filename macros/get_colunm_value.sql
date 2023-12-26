-- Fichier: macros/my_macros.sql
{% macro get_column_value(table, column, id) %}

    {{ log('STORE_ID: ' ~ id, info=True) }}

    {% set query %}
        SELECT
            {{ column }}
        FROM {{ table }}
        WHERE id = {{ id }}
    {% endset %}
    
    {{ log(query, true) }}

    {% set results = run_query(query) %}

    {% if execute %}
        {% set values = results.columns[0].values() %}
        {{ log(values, info=True) }}
        {{ return(values) }}
    {% else %}
        return 0
    {% endif %}

{% endmacro %}
