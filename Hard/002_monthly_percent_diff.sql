/*
Problem: Monthly Percentage Difference
Platform: StrataScratch
Difficulty: Hard

Problem Summary:
Calculate the month-over-month percentage change in total transaction value.

Approach:
1. Aggregate total transaction value for each month.
2. Assign row numbers ordered by month.
3. Self join the table to get the previous month's value.
4. Calculate the percentage difference using:
   ((current_month - previous_month) / previous_month) * 100
*/

WITH cte AS (
    SELECT 
        FORMAT(created_at, 'yyyy-MM') AS month,
        SUM(value) AS val,
        ROW_NUMBER() OVER (ORDER BY FORMAT(created_at, 'yyyy-MM')) AS row_num
    FROM sf_transactions
    GROUP BY FORMAT(created_at, 'yyyy-MM')
)

SELECT 
    curr.month,
    ((curr.val - lt.val) * 1.0 / lt.val) * 100 AS percentage_diff
FROM cte curr
LEFT JOIN cte lt
    ON lt.row_num = curr.row_num - 1;
