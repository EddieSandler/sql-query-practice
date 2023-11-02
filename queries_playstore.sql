-- -1. Find the app with an ID of ***1880***
SELECT id,app_name FROM analytics WHERE id=1880;


-- 2. Find the ID and app name for all apps that were last updated on August 01, 2018.
select id , app_name FROM analytics WHERE last_updated = DATE '2018-08-01';

-- 3. Count the number of apps in each category, e.g. “Family | 1972”.
SELECT category,COUNT(category) from analytics GROUP BY category


-- 4. Find the top 5 most-reviewed apps and the number of reviews for each.
SELECT app_name, SUM(reviews) as sum_reviews FROM analytics
GROUP BY app_name ORDER BY sum_reviews desc LIMIT 5;

-- 5. Find the app that has the most reviews with a rating greater than equal to 4.8.
SELECT app_name,SUM(reviews) as sum_reviews from analytics GROUP BY app_name
HAVING AVG(rating) >= 4.8 ORDER by sum_reviews desc limit 1

-- 6. Find the average rating for each category ordered by the highest rated to lowest rated.
SELECT category, AVG(rating) as avg_rating from analytics
GROUP BY category ORDER BY avg_rating desc;

-- 7. Find the name, price, and rating of the most expensive app with a rating that’s less than 3.
SELECT app_name,MAX(price) as price,AVG(rating) FROM analytics
GROUP BY app_name HAVING AVG(rating)<3
ORDER BY MAX(price) desc LIMIT 1;

-- 8. Find all apps with a min install not exceeding 50, that have a rating.
--Order your results by highest rated first.
 SELECT app_name,min_installs,rating FROM analytics
 WHERE min_installs<50 AND rating >0
 ORDER BY rating desc;


-- 9. Find the names of all apps that are rated less than 3 with at least 10000 reviews.
SELECT app_name, sum(reviews) as reviews,AVG(rating) as rating FROM analytics
GROUP BY app_name HAVING SUM(reviews) >=10000
and AVG(rating) <3;

-- 10. Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT app_name,price,SUM(reviews)as sum_reviews FROM analytics
GROUP BY app_name,price HAVING price >=.10 AND price <=1
ORDER BY SUM(reviews) desc LIMIT 10;


-- 11. Find the most out of date app. Hint: You don’t need to do it this way, but it’s possible to do with a subquery: http://www.postgresqltutorial.com/postgresql-max-function/
SELECT app_name,MIN(last_updated) FROM analytics GROUP by app_name
ORDER BY MIN(last_updated) asc limit 1;

-- 12. Find the most expensive app (the query is very similar to #11).

SELECT app_name, MAX(price) FROM Analytics GROUP BY app_name ORDER BY MAX(price) desc LIMIT 1;
-- 13. Count all the reviews in the Google Play Store.
SELECT COUNT(reviews) as count_of_all_reviews FROM analytics;

-- 14. Find all the categories that have more than 300 apps in them.
SELECT category,COUNT(app_name)as num_apps FROM analytics
GROUP by category
HAVING COUNT(app_name)>300 ORDER BY COUNT(app_name)desc;

-- 15. Find the app that has the highest proportion of min_installs to reviews,
--among apps that have been installed at least 100,000 times.
--Display the name of the app along with the number of reviews, the min_installs,
--and the proportion.

SELECT app_name,reviews, min_installs, min_installs/reviews as proportion
FROM analytics WHERE min_installs >100000 ORDER BY min_installs/reviews desc limit 1;



