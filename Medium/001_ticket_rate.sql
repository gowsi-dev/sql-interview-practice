-- Problem Summary:
-- Calculate the processed rate of tickets for each complaint type.
-- Processed rate = (Number of processed tickets) / (Total tickets for that type)

-- Source: StrataScratch
-- Difficulty: Medium

-- Approach:
-- 1. Group the data by complaint type.
-- 2. Use CASE WHEN to count only processed tickets.
-- 3. Count total tickets for each type.
-- 4. Divide processed tickets by total tickets to get the rate.

SELECT 
    fc.type AS type,
    SUM(CASE WHEN processed = 'TRUE' THEN 1 ELSE 0 END) * 1.0 
        / COUNT(*) AS processed_rate
FROM facebook_complaints fc
GROUP BY fc.type;