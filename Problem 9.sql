
-- Q9.Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? 

WIth yrly_sales AS(
        SELECT c.channel,
		ROUND(SUM(g.gross_price * f.sold_quantity)/1000000,2) as gross_sales_mln
        FROM fact_sales_monthly f
        JOIN dim_customer c ON c.customer_code=f.customer_code
		JOIN fact_gross_price g ON g.product_code=f.product_code
		WHERE f.fiscal_year = 2021
        GROUP BY channel
		),
        total_Sales as(
                  SELECT SUM(gross_sales_mln) as total_gross_Sales
				  FROM yrly_Sales
		)
                  
		SELECT 
               y.channel,
               y.gross_sales_mln, 
               ROUND(y.gross_sales_mln / t.total_gross_sales * 100, 2) AS gross_sales_pct 
               FROM yrly_sales y
               CROSS JOIN total_sales t
			   ORDER BY gross_sales_pct DESC;