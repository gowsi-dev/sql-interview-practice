/*
Problem: Number of Shipments Per Month
Platform: StrataScratch
Difficulty: Easy

Problem Summary:
Calculate the number of shipments per month.
A shipment is uniquely identified by (shipment_id, sub_id).

Approach:
1. Convert shipment_date into YYYY-MM format.
2. Count distinct combinations of shipment_id and sub_id.
3. Group results by month.
*/

SELECT 
    FORMAT(shipment_date, 'yyyy-MM') AS year_month,
    COUNT(DISTINCT shipment_id, sub_id) AS shipment_count
FROM amazon_shipment
GROUP BY FORMAT(shipment_date, 'yyyy-MM');
