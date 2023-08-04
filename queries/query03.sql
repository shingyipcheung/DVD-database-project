-- find stores with more than 50 unique movies:
SELECT store_id, COUNT(DISTINCT film_id) AS number_of_movies
FROM inventory
GROUP BY store_id
HAVING COUNT(DISTINCT film_id) > 50;