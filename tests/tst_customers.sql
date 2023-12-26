{% test warn_if_odd(model, column_name) %}

    {{ config(severity = 'warn') }}
    {{ log(model+" ==> "+column_name, info=True) }}

    select *
    from {{ model }}
    where  {{ dbt.split_part(column_name, "' '", 2) }} = ''

{% endtest %}