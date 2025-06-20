 
 -- Q6. Generate a report which contains the top 5 customers who received an average high  pre_invoice_discount_pct  
--  for the  fiscal  year 2021  and in the  Indian  market. 

     SELECT d.customer_code,d.customer,
             pre_invoice_discount_pct  AS average_discount_percentage
	 FROM dim_customer d
	 JOIN fact_pre_invoice_deductions f USING (customer_code)
     WHERE market="India" and fiscal_year=2021
     ORDER BY average_discount_percentage DESC
     LIMIT 5;