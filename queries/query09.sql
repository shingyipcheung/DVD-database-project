-- categorizes customers based on their total spend
SELECT
  customer_id,
  SUM(amount) AS total_spend,
  CASE
    WHEN SUM(amount) < 50 THEN 'Low spender'
    WHEN SUM(amount) >= 50 AND SUM(amount) < 150 THEN 'Medium spender'
    ELSE 'High spender'
  END AS spending_category
FROM
  payment
GROUP BY
  customer_id
ORDER BY
  total_spend DESC;