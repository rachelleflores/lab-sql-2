# UNIT 2 LAB 2
USE sakila;
# Instructions
# 1. Select all the actors with the first name ‘Scarlett’.
SELECT *
FROM actor
WHERE first_name = 'Scarlett';

# 2. Select all the actors with the last name ‘Johansson’.
SELECT *
FROM actor
WHERE last_name = 'Johansson';

# 3. How many films (movies) are available for rent?
SELECT COUNT(DISTINCT (film_id))
FROM film;

# 4. How many films have been rented?
SELECT COUNT(DISTINCT film_id)
FROM inventory;

SELECT DISTINCT f.title, 
    f.description
FROM film as f
INNER JOIN inventory as i
ON f.film_id = i.film_id
INNER JOIN rental as r
ON i.inventory_id = r.inventory_id;

# 5. What is the shortest and longest rental period?
-- Wasn't sure what the question meant.

# Min and Max Rental Duration in days set by the rental company
SELECT 
	min(rental_duration) as shortest,
    max(rental_duration) as longest
FROM film;

# Min and Max number of days customers rented a film
SELECT
	MAX(DATEDIFF(return_date, rental_date)) as max_rental_duration,
    MIN(DATEDIFF(return_date, rental_date)) as min_rental_duration
FROM rental;

# 6. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT
	min(length) as min_duration,
    max(length) as max_duration
FROM film;

# 7. What's the average movie duration?
SELECT ROUND(AVG(length),2) as avg_movie_duration
FROM film;

# 8. What's the average movie duration expressed in format (hours, minutes)?
SELECT SEC_TO_TIME(AVG(length)*60) as avg_movie_duration_hours
FROM film;

# 9. How many movies longer than 3 hours?
SELECT COUNT(film_id)
FROM film
WHERE length > 60*3;

# 10. Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
SELECT
	CONCAT(UPPER(LEFT(first_name,1)), LOWER(SUBSTR(first_name,2))) as first_name,
    UPPER(last_name) as last_name,
    LOWER(email) as email
FROM customer;

# 11. What's the length of the longest film title?
SELECT MAX(LENGTH(title)) as count_longest_title
FROM film;