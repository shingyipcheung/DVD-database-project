-- film_rentals: finds the total rentals for each film
WITH film_rentals AS (
    SELECT film_id, COUNT(rental_id) as total_rentals
    FROM inventory
    JOIN rental ON inventory.inventory_id = rental.inventory_id
    GROUP BY film_id
),
-- finds the film with the most rentals
most_rented_film AS (
    SELECT film_id
    FROM film_rentals
    ORDER BY total_rentals DESC
    LIMIT 1
),
--  calculates the total payment made by each customer for the most rented film
customer_payments AS (
    SELECT payment.customer_id, SUM(payment.amount) as total_payment
    FROM payment
    JOIN rental ON payment.rental_id = rental.rental_id
    JOIN inventory ON rental.inventory_id = inventory.inventory_id
    WHERE inventory.film_id = (SELECT film_id FROM most_rented_film)
    GROUP BY payment.customer_id
)
SELECT *
FROM customer_payments
ORDER BY total_payment DESC;