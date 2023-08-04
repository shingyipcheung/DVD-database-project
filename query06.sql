-- get running total payments for each customer
SELECT
    payment_date,
    customer_id,
    amount,
    SUM(amount) OVER(PARTITION BY customer_id ORDER BY payment_date) as running_total
FROM payment;