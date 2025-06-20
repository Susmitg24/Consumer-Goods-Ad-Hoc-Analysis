
-- Q8. In which quarter of 2020, got the maximum total_sold_quantity?

WITH CTE AS (
    SELECT 
        *,
        CONCAT('Q', CEILING(MONTH(DATE_ADD(DATE,INTERVAL 4 Month))/3)) AS Quarters
    FROM Fact_Sales_monthly
) 

SELECT Quarters,SUM(sold_quantity) AS 
total_sold_qty
FROM
    CTE
 WHERE
    fiscal_year = 2020
GROUP BY Quarters
ORDER BY total_sold_qty DESC;