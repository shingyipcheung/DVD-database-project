-- Count the number of rentals for each movie, and include the movie title:
SELECT m.title, COUNT(r.rental_id) AS number_of_rentals
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film m ON m.film_id = i.film_id
GROUP BY m.title;