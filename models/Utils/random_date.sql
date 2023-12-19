{{ config(materialized="ephemeral") }}
with
    source as (
        {{ dbt_date.get_date_dimension(var("DIM_DATE_START"), var("DIM_DATE_END")) }}
    ),

final as (
    select * from source order by random())

select * from final