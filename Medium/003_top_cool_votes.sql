-- Problem Summary:
-- Find the highest number of cool vote.

-- Source: StrataScratch
-- Difficulty: Medium

-- Approach:
-- 1. Get max coot vote from subquery.
-- 2. Check the max vote in WHERE clause.

SELECT
  business_name, 
  review_text 
FROM yelp_reviews 
WHERE cool = (
  SELECT MAX(cool) FROM yelp_reviews
)
