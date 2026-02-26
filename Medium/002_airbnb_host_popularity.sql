-- Problem Summary:
-- Categorize hosts based on number of reviews into popularity levels
-- and calculate the minimum, average, and maximum rental price for each category.

-- Popularity Levels:
-- 0 reviews: New
-- 1–5 reviews: Rising
-- 6–15 reviews: Trending Up
-- 16–40 reviews: Popular
-- More than 40 reviews: Hot

-- Source: StrataScratch
-- Difficulty: Medium

-- Approach:
-- 1. Use CASE expression to classify hosts based on review count.
-- 2. Store classification in a CTE for better readability.
-- 3. Aggregate prices using MIN, AVG, and MAX.
-- 4. Group by popularity category.
-- 5. Order results by minimum price.

with cte as (
    select CASE
        WHEN number_of_reviews = 0 THEN 'New'
        WHEN number_of_reviews >= 1 AND number_of_reviews <=5 THEN 'Rising'
        WHEN number_of_reviews >= 6 AND number_of_reviews <=15 THEN 'Trending Up'
        WHEN number_of_reviews >=16 AND number_of_reviews <=40 THEN 'Popular'
        ELSE 'Hot'
    END as host_popularity,
    price
    from airbnb_host_searches
)
select host_popularity, MIN(price) as min_price, AVG(price) as avg_price, MAX(price) as max_price from cte
group by host_popularity
order by MIN(price);
