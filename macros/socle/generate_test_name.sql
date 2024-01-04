{% set message = {
        "a": 1,
        "b": 2, 
        "c": 3
    } 
%}

{% macro generate_test_name(model, column_name) %}

{% set test_type = 1212 %}
    
    return ({{column_name ~'_'~ test_type}})

{% endmacro %}

