create database if not exists netflix;
use netflix;

# 1. Find the total number of titles added each month.
SELECT 
  MONTH(STR_TO_DATE(date_added, '%m/%d/%Y')) AS month,
  COUNT(*) AS total_titles
FROM netflix
GROUP BY month
ORDER BY month;


# 2. List all TV Shows with exactly 1 season.
SELECT * FROM netflix 
WHERE type = 'TV Show' AND duration = '1 Season';


# 3. Find the average duration (in minutes) of movies.
SELECT AVG(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)) AS avg_duration 
FROM netflix 
WHERE type = 'Movie';


# 4. Find the country with the most number of TV Shows.
SELECT country, COUNT(*) AS total 
FROM netflix 
WHERE type = 'TV Show'
GROUP BY country 
ORDER BY total DESC 
LIMIT 1;


# 5. Get the top 3 directors with the most movies.
SELECT director, COUNT(*) AS movie_count 
FROM netflix 
WHERE type = 'Movie' AND director IS NOT NULL
GROUP BY director 
ORDER BY movie_count DESC 
LIMIT 3;


# 6. Show all content added in the last 90 days of 2021 (from the latest date).
SELECT * FROM netflix 
WHERE STR_TO_DATE(date_added, '%m/%d/%Y') >= DATE_SUB('2021-09-25', INTERVAL 90 DAY);


# 7. List movies that are longer than the average movie duration.
SELECT * 
FROM netflix 
WHERE type = 'Movie' 
  AND CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > (
    SELECT AVG(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)) 
    FROM netflix WHERE type = 'Movie'
  );
  

# 8. Find all shows that fall under both 'Comedies' and 'Children & Family Movies'.
SELECT * FROM netflix 
WHERE listed_in LIKE '%Comedies%' 
  AND listed_in LIKE '%Children & Family Movies%';
  


# 9. List the shows with word 'Adventure' in the genre.
SELECT * FROM netflix 
WHERE listed_in LIKE '%Adventure%';



# 10. Find how many 'Afterparty' titles were released in each year.
SELECT release_year, COUNT(*) AS count 
FROM netflix 
WHERE title LIKE '%Afterparty%' 
GROUP BY release_year;


  








