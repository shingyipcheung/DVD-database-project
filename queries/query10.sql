-- pagination of film
CREATE OR REPLACE FUNCTION get_films_paginated(page_num INTEGER, per_page INTEGER)
RETURNS TABLE(
    film_id integer,
    title VARCHAR(255),
    description TEXT,
    release_year year,
    language_id smallint,
    rental_duration smallint,
    rental_rate NUMERIC(4, 2),
    length smallint,
    replacement_cost NUMERIC(5, 2),
    rating mpaa_rating,
    last_update TIMESTAMP,
    special_features TEXT[],
    fulltext TSVECTOR
)
LANGUAGE plpgsql AS $$
BEGIN
RETURN QUERY
    SELECT *
    FROM film
    ORDER BY film_id
    LIMIT per_page
    OFFSET (page_num - 1) * per_page;
END; $$;

SELECT * FROM get_films_paginated(2, 30);