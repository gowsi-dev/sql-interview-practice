/*
Problem: Count the Number of User Events Performed by MacBook Pro Users
Platform: StrataScratch
Difficulty: Easy

Problem Summary:
Find the number of events performed by users who are using a MacBook Pro.
Return the event name and the count of each event, ordered by count descending.

Approach:
1. Filter records where device = 'macbook pro'.
2. Group by event_name.
3. Count occurrences of each event.
4. Sort results in descending order of event count.
*/

SELECT 
    event_name, 
    COUNT(*) AS event_count
FROM playbook_events 
WHERE device = 'macbook pro'
GROUP BY event_name
ORDER BY event_count DESC;
