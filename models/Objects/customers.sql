WITH source as(
    select *  from {{ref('trans_customer')}}
),

final AS(
    select * from source
)


select * from final
