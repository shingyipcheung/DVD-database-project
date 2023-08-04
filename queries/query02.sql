-- list each payment and the movie it was for, ordered by the payment amount:
SELECT
    m.title,
    SUM(p.amount) AS total_amount
FROM
    payment p
JOIN
    rental r ON p.rental_id = r.rental_id
JOIN
    inventory i ON r.inventory_id = i.inventory_id
JOIN
    film m ON i.film_id = m.film_id
GROUP BY
    m.film_id
ORDER BY
    total_amount DESC;