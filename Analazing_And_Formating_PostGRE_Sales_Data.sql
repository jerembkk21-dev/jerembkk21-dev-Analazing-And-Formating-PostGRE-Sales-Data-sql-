-- top_five_products_each_category

WITH ranked_products AS (
    SELECT
        p.category,
        p.product_name,
        ROUND(SUM(o.sales)::numeric, 2) AS product_total_sales,
        ROUND(SUM(o.profit)::numeric, 2) AS product_total_profit,
        ROW_NUMBER() OVER (
            PARTITION BY p.category
            ORDER BY SUM(o.sales) DESC
        ) AS product_rank
    FROM orders o
    JOIN products p
        ON o.product_id = p.product_id
    GROUP BY
        p.category,
        p.product_name
)

SELECT
    category,
    product_name,
    product_total_sales,
    product_total_profit,
    product_rank
FROM ranked_products
WHERE product_rank <= 5
ORDER BY
    category ASC,
    product_total_sales DESC;

-- impute_missing_values

WITH unit_price_cte AS (
    SELECT
        product_id,
        AVG(sales / NULLIF(quantity, 0)) AS unit_price
    FROM orders
    WHERE quantity IS NOT NULL
    GROUP BY product_id
)
SELECT
    o.product_id,
    o.discount,
    o.market,
    o.region,
    o.sales,
    o.quantity,
    ROUND(
        o.sales / NULLIF(u.unit_price, 0)
    )::integer AS calculated_quantity
FROM orders o
LEFT JOIN unit_price_cte u
    ON o.product_id = u.product_id
WHERE o.quantity IS NULL;
