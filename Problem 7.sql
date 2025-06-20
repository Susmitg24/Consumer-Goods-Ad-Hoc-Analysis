
-- Q7. Get the complete report of the Gross sales amount for the customer  “Atliq 
--  Exclusive”  for each month.This analysis helps to  get an idea of low and 
--  high-performing months and take strategic decisions.

WITH CTE AS (
 SELECT 
    s.*, c.customer, g.gross_price
 FROM
    fact_sales_monthly s
        JOIN
    dim_customer c USING (customer_code)
        JOIN
    fact_gross_price g USING (product_code)
 ) 
SELECT 
    MONTH(date) AS month_no,
    YEAR(Date) AS yr,
    ROUND(SUM(gross_price * sold_quantity), 2) AS Gross_sales_amount
 FROM
    cte
 WHERE
    customer = 'Atliq Exclusive'
 GROUP BY month_no , Yr;