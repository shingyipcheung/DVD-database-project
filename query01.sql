-- Count how many DVDs each customer has rented
SELECT customer_id, COUNT(*) AS num_rentals
FROM rental
GROUP BY customer_id;