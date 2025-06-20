-- Q2. What is the percentage of unique product increase in 2021 vs. 2020?

SELECT 
       unique_products_2020,
       unique_products_2021,
       Round((unique_products_2021-unique_products_2020)*100/ unique_products_2020,2) as percentage_chnge
FROM 
      (SELECT
        COUNT(distinct case when f.fiscal_year=2020 then p.product_code END) as unique_products_2020,
		COUNT(distinct case when f.fiscal_year=2021 then p.product_code END) as unique_products_2021
FROM 
      dim_product p
JOIN
	 fact_sales_monthly f USING (product_code)
WHERE 
     f.fiscal_year IN (2020, 2021)
) 
     as product_counts;