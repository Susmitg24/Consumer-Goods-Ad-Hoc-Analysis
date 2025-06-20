
-- Q10. Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021?        

WITH top_products AS (
    SELECT 
        p.division,
        f.product_code,
        p.product,
        ROUND(SUM(f.sold_quantity), 2) AS total_sold_quantity,
        RANK() OVER (
            PARTITION BY p.division 
            ORDER BY SUM(f.sold_quantity) DESC
        ) AS rank_order
    FROM fact_sales_monthly f
    JOIN dim_product p USING (Product_code)
    WHERE f.fiscal_year = 2021
    GROUP BY p.division,f.product_code, p.product
    )
    
    SELECT *
    FROM top_products
    WHERE rank_order <4;      