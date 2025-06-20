 
 -- Q4.Which segment had the most increase in unique products in 2021 vs 2020? 
 
 WITH   Product_counts AS (
       SELECT segment,
       COUNT(DISTINCT CASE WHEN f.fiscal_year=2020 THEN p.product_code END) AS product_count_2020,
       COUNT(DISTINCT CASE WHEN f.fiscal_year=2021 THEN p.product_code END) AS product_count_2021
FROM
       dim_product p
JOIN  
       fact_sales_monthly f USING (product_code)
WHERE f.fiscal_year IN (2020, 2021)
GROUP BY segment
) 

Select Segment,
Product_count_2020,
Product_count_2021,
Product_count_2021-product_count_2020 as Difference
FROM
      product_counts
ORDER BY  
      Difference desc;