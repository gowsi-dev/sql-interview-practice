/*
Problem: Best Selling Item Per Month  
Platform: StrataScratch  
Difficulty: Hard  

Problem Summary:
Find the most profitable item for each month based on total revenue.
Revenue is calculated as unitprice * quantity.  
Ignore cancelled transactions (invoiceno starting with 'C').

Approach:
1. Filter out invoice numbers starting with 'C' (cancellations).
2. In a CTE, calculate:
   - month(invoicedate)
   - item description
   - total revenue per item per month.
3. Use ROW_NUMBER() partitioned by month to rank items by revenue descending.
4. Select only the top item (row_num = 1) per month.
5. Order results by month ascending.
*/

WITH cte AS (
    SELECT  
        MONTH(invoicedate) AS month,
        description,
        SUM(unitprice * quantity) AS total_paid,
        ROW_NUMBER() OVER (
            PARTITION BY MONTH(invoicedate)
            ORDER BY SUM(unitprice * quantity) DESC
        ) AS row_num
    FROM online_retail
    WHERE invoiceno NOT LIKE 'C%' 
    GROUP BY 
        MONTH(invoicedate), 
        description
)
SELECT 
    month, 
    description, 
    total_paid
FROM cte
WHERE row_num = 1
ORDER BY month ASC;