 
with mix as (
    SELECT p.*, s.* except(products_id),
     quantity*purchase_price as purchase_cost
    FROM {{ ref('stg_raw__product') }} p
    JOIN {{ ref('stg_raw__sales') }} s
        ON p.products_id = s.products_id
)
SELECT *,
    revenue-purchase_cost as margin
FROM mix