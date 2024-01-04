with
    source as (select * from {{ ref("trans_supplier") }}),

    fianl as (select * from source)

select *
from fianl
