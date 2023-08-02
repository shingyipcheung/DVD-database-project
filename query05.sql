--  list of customers who have rented films from the 'Comedy' category
--  but never rented films from the 'Drama' category.

-- Customers who have rented Comedy films
(SELECT r.customer_id
 FROM rental r
 JOIN inventory i ON i.inventory_id = r.inventory_id
 JOIN film f ON f.film_id = i.film_id
 JOIN film_category fc ON fc.film_id = f.film_id
 JOIN category c ON c.category_id = fc.category_id
 WHERE c.name = 'Comedy')

EXCEPT

-- Customers who have rented Drama films
(SELECT r.customer_id
 FROM rental r
 JOIN inventory i ON i.inventory_id = r.inventory_id
 JOIN film f ON f.film_id = i.film_id
 JOIN film_category fc ON fc.film_id = f.film_id
 JOIN category c ON c.category_id = fc.category_id
 WHERE c.name = 'Drama');