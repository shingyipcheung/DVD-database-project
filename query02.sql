-- Find all rentals that were not returned
SELECT * FROM rental WHERE return_date IS NULL;