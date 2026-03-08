/*
Problem: Unique Users Per Client Per Month
Platform: StrataScratch
Difficulty: Easy

Problem Summary:
Return the number of unique users per client for each month
Return results month in ascending order of appearances.

Approach:
1. Group by the client_id and month
2. Order the result by month in ascending order.
*/

SELECT 
  client_id, 
  month(time_id) as month, 
  count(distinct user_id) as users_num 
FROM fact_events
GROUP BY month(time_id), client_id
ORDER BY month(time_id);
