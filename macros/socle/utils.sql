{% macro __logger(message, p_debug_level=none) %}
{% set debug_level = var('debug_level') %}
{% set debug_level_Info = var('debug_level_Info') %}
{%-if p_debug_level is none -%}
        {% set p_debug_level = var('debug_level_Info') %}
{%-endif-%}
{%if debug_level <=  p_debug_level %}
        {% do log(''~modules.datetime.datetime.now().strftime('%H:%M:%S')~' | '~message, info=true) %}
{%endif%}
{% endmacro %}