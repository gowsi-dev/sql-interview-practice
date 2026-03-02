/*
Problem: Top Ranked Songs
Platform: StrataScratch
Difficulty: Easy

Problem Summary:
Find the song(s) that appeared in the top position (position = 1)
the highest number of times.
Return results in descending order of appearances.

Approach:
1. Filter rows where position = 1.
2. Group by trackname.
3. Count the number of occurrences.
4. Order the result by count in descending order.
*/

SELECT 
    trackname, 
    COUNT(*) AS times_top1
FROM spotify_worldwide_daily_song_ranking
WHERE position = 1
GROUP BY trackname
ORDER BY times_top1 DESC;
