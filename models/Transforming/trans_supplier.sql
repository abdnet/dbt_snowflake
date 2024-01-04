with
    source as (select * from {{ ref("stg_supplies") }}),

    renamed as (select id, name, cost, perishable, sku from source),

    final as (select * from renamed)

select *
from final
