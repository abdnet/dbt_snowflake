{% macro country_code(country) %}

    case
        when trim(lower({{ country }})) = "germany" then "49"
        when trim(lower({{ country }})) = "france" then "33"
    end

{% endmacro %}


{% macro e164(phone_number, country) %}

  case
      when
         left(
              ltrim(
                regexp_replace(
                    {{ phone_number }}, '[^0-9]+', ''
                ), '0'
              )
              , length(
                  {{ country_code(country) }}
              )
          ) = {{ country_code(country) }}
      then
          concat(
              '+'
              , ltrim(
                  regexp_replace(
                      {{ phone_number }}, '[^0-9]+', ''
                  ), '0'
              )
          )
      else
          concat(
              '+'
              , {{ country_code(country) }}
              , ltrim(
                  regexp_replace(
                      {{ phone_number }}, '[^0-9]+', ''
                  )
                  , '0'
              )
          )
      end

{% endmacro %}