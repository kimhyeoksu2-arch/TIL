WITH min_date AS (
SELECT customer_id
    , MIN(order_date) AS order_date
FROM Delivery 
GROUP BY customer_id
)

SELECT ROUND(AVG(CASE WHEN D.order_date = D.customer_pref_delivery_date THEN 1 ELSE 0 END) * 100, 2) AS immediate_percentage 
FROM min_date m
JOIN Delivery D 
    ON D.customer_id = m.customer_id 
    AND D.order_date = m.order_date
