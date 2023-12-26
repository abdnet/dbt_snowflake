{% macro start__end__monitoring_global(process_action, node) %}

    {%- if execute -%}
        {% set log_message = (
            modules.datetime.datetime.now().strftime("%H:%M:%S")
            ~ " | "
            ~ "End run"
        ) %}

        {% set environment_name = target.name.upper() %}
        {% set batch_process_id = var("batch_id") | replace("-", "_") %}
        {% set table_process = var("process_db_schema_table_name") %}

        {% set new_monitoring %}
           insert into {{table_process}} (
                        LOAD_DTS, 
                        TYPE_LOG, 
                        DATABASE, 
                        PROCESS, 
                        SCHEMA, 
                        SNOWFLAKE_TAG, 
                        STEP, 
                        ENTITY, 
                        DATE_DTS,
                        STATUS, 
                        PARAMETERS, 
                        ACTION, 
                        QUERY_ID, 
                        QUERY_TYPE, 
                        NB_ROW
                        ) values(
                        convert_timezone('Europe/Paris', '{{ var("load_date") }}')::timestamp_ntz,
                        '{{ log_type }}',
                        '{{ target.database}}',
                        'main',
                        '{{ target.schema}}',
                        null,
                        null,
                        null,
                        convert_timezone('Europe/Paris',current_timestamp())::timestamp_ntz,
                        null,
                        null,
                        '{{ process_action }}',
                        null,
                        'main',
                        null
                        --,'{{ var('batch_id')}}'
                        );

        {% endset %}
        {{ log(new_monitoring, info=True) }}
        {% do return(new_monitoring) %}
    {% endif %}

{% endmacro %}

{% macro start__end__monitoring_local(process_action,node) %}
    {%- if execute -%}

        {% set log_message = (
            modules.datetime.datetime.now().strftime("%H:%M:%S")
            ~ " | "
            ~ "start run"
        ) %}

        {% set environment_name = target.name.upper() %}
        {% set batch_process_id = var("batch_id") | replace("-", "_") %}
        {% set table_process = (
            var("process_db_schema_table_name")
        ) %}
        {% set new_monitoring %}
           insert into {{table_process}} (
                        LOAD_DTS, 
                        TYPE_LOG, 
                        DATABASE, 
                        PROCESS, 
                        SCHEMA, 
                        SNOWFLAKE_TAG, 
                        STEP, 
                        ENTITY, 
                        DATE_DTS,
                        STATUS, 
                        PARAMETERS, 
                        ACTION, 
                        QUERY_ID, 
                        QUERY_TYPE, 
                        NB_ROW
                        ) values(
                                convert_timezone('Europe/Paris', '{{ var("load_date") }}')::timestamp_ntz,
                                '{{ log_type }}',
                                '{{ model.database}}',
                                '{{ model.path.split("\\")[0]}}',
                                '{{ model.schema}}',
                                '{{ model.config.query_tag}}',
                                '{{ model.name }}',
                                '{{ model.alias }}',
                                convert_timezone('Europe/Paris',current_timestamp())::timestamp_ntz,
                                null,
                                null,
                                '{{ process_action }}',
                                null,
                                '{{ model.config.materialized }}',
                                null
                                --,'{{ var('batch_id')}}'
                        );

        {% endset %}
        {{ log(model, info=True) }}
        {% do return(new_monitoring) %}
    {% endif %}
{% endmacro %}
