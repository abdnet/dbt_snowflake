with
    source as (select * from {{ ref("supplies") }}),

    fianl as (select * from source)

select *
from fianl
