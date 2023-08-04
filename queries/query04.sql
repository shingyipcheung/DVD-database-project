-- return all distinct customer_ids who have either rented films from category 5 or made a payment greater than 20
SELECT customer_id FROM film_category
INNER JOIN inventory ON film_category.film_id = inventory.film_id
INNER JOIN rental ON inventory.inventory_id = rental.inventory_id
WHERE category_id = 5
UNION
SELECT customer_id FROM payment WHERE amount > 20;