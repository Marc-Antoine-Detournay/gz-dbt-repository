with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        shipping_fee_1,
        logcost,
        CAST (ship_cost as FLOAT64) as ship_cost

    from source
    -- WHERE shipping_fee <> shipping_fee_1 
)

select * from renamed
