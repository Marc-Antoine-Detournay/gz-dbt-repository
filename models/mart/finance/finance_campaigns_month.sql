WITH union_table AS (
SELECT *
FROM {{ ref('int_campaigns_day') }}
LEFT JOIN {{ ref('finance_days') }}
    using (date_date)
)

SELECT 
    date_trunc(date_date, MONTH) AS month_date,
    SUM(operational_margin - ads_cost) as ads_margin,
    SUM(average_basket) as average_basket,
    SUM(operational_margin) as operational_margin,
    SUM(ads_cost) as ads_cost,
    SUM(ads_impressions) as ads_impressions,
    SUM(ads_click) as ads_click,
    SUM(quantity) as quantity,
    SUM(revenue) as revenue,
    SUM(purchase_cost) as purchase_cost,
    SUM(margin) as margin,
    SUM(shipping_fee) as shipping_fee,
    SUM(logcost) as logcost,
    SUM(ship_cost) as ship_cost
FROM union_table
GROUP BY month_date
ORDER BY month_date DESC
