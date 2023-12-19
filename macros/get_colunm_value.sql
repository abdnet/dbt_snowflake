{% macro get_column_value(table, column,colunm_filter,colunm_value) %}
    {{ log(colunm_id, info=True) }}
    {% set query %}
        SELECT
            {{ column }}
        FROM {{ table }}
        WHERE {{ colunm_filter }} ='{{ colunm_value[0]  }}'
    {% endset %}
    
    {{ log(query, true) }}
    
    {% set results = run_query(query) %}
    
    {% if execute %}
        {% if result.rows %}
            {% set value= result.colunms[0].values[0]%}
            {% else %}
            {% set value= 0 %}
         {% endif %}
        {{value}}
    {% endif %}
--{{return (0)}}
{% endmacro %}


{% macro get_column_value2(table, column, colunm_id) %}
    {{ log(colunm_id, info=True) }}
       SELECT
            {{ column }}
        FROM {{ table }}
        WHERE id ={{ colunm_id  }}
{% endmacro %}

{% macro getTax(table_name, column_name, filter_column, filter_value_column) %}

  {% set query %}
    SELECT {{ column_name }}
    FROM {{ table_name }}
    WHERE {{ filter_column }} = '{{ filter_value_column }}'
  {% endset %}

  {% set result = run_query(query) %}
  {% if result.rows %}
    {% set value= result.colunms[0].values[0]%}
    {% else %}
    {% set value= 0 %}
  {% endif %}
    {{value}}
{% endmacro %}