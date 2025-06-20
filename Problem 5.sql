
-- Q5.Get the products that have the highest and lowest manufacturing costs.

SELECT p.product_code,
            p.product,
            m.manufacturing_cost
     FROM dim_product p
     JOIN fact_manufacturing_cost m USING (product_code)
	 WHERE m.manufacturing_cost=(SELECT MAX(manufacturing_cost) 
     FROM fact_manufacturing_cost
	 )
    OR m.manufacturing_cost=(SELECT MIN(manufacturing_cost) 
	FROM fact_manufacturing_cost
	)
    ORDER BY manufacturing_cost DESC;