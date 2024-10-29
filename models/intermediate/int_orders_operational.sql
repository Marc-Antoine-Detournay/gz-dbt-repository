with mix as (
    SELECT o.*, s.* except(orders_id),
    FROM {{ ref('int_orders_margin') }} o
    JOIN {{ ref('stg_raw__ship') }} s
        ON o.orders_id = s.orders_id
)
SELECT orders_id, date_date,
    margin+shipping_fee-logcost-ship_cost as operational_margin
FROM mix
