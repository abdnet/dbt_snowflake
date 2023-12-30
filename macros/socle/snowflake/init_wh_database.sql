{%- macro truncate_tables(schema_name, database_name) -%}
    {%- set tables = codegen.get_tables_in_schema(schema_name, database_name) -%}

    {{ log("Init database " ~ database_name ~ " : TRUNCATE TABLES", info=True) }}
    {%- for table in tables -%}
        {{ log("TRUNCATE TABLE: " ~ table, info=True) }}

        TRUNCATE TABLE {{ database_name }}.{{ schema_name }}.{{ table }};
    {%- endfor -%}

{%- endmacro -%}


{% macro init_database() %}
    {% if var("INIT_ALL_DATABASES") %}
        {% set databases = var("INIT_DATABASES") %}
        {% for item in databases %}
            {% set schemas = var(item) %}
            {% for schema_name in schemas %}
                {{ truncate_tables(schema_name, item) }}
            {% endfor %}

        {% endfor %}
    {% endif %}

{% endmacro %}

{% macro drop_all_schema() %}

{% if var("INIT_ALL_DATABASES") %}
        {% set databases = var("INIT_DATABASES") %}
        {% for item in databases %}
            {% set schemas = var(item) %}
            {% for schema_name in schemas %}
                    DROP SCHEMA {{item}}.{{ schema_name }};
                    commit;
            {% endfor %}

        {% endfor %}
    {% endif %}
{% endmacro %}
