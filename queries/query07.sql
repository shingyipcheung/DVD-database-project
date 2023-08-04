-- get the ranking of customers based on their total payment
SELECT
    customer_id,
    SUM(amount) as total_payment,
    RANK() OVER (ORDER BY SUM(amount) DESC) as payment_rank
FROM payment
GROUP BY customer_id;