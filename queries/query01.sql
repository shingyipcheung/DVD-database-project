-- find all the films that have been rented by a specific customer with customer_id = 1
SELECT f.film_id, f.title
FROM film f
WHERE f.film_id IN (
    SELECT i.film_id
    FROM rental r
    INNER JOIN inventory i ON r.inventory_id = i.inventory_id
    WHERE r.customer_id = 1
);
