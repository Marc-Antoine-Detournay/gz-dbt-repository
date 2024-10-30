WITH union_table AS (
SELECT *
FROM {{ ref('int_campaigns_day') }}
LEFT JOIN {{ ref('finance_days') }}
    using (date_date)
)

SELECT 
    date_date,
    (operational_margin - ads_cost) as ads_margin,
    average_basket,
    operational_margin,
    ads_cost,
    ads_impressions,
    ads_click,
    quantity,
    revenue,
    purchase_cost,
    margin,
    shipping_fee,
    logcost,
    ship_cost
FROM union_table
ORDER BY date_date DESC