USE olist_ecommerce;

/*---------Q1- Weekday Vs Weekend (order_purchase_timestamp) Payment Statistics----------*/
SELECT
    o.order_id,
    o.order_purchase_timestamp,
    p.payment_type,
    p.payment_value
FROM orders o
JOIN order_payments p
    ON o.order_id = p.order_id;
    
SELECT
    CASE
        WHEN DAYOFWEEK(o.order_purchase_timestamp) IN (1, 7)
            THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    p.payment_type,
    COUNT(*) AS payment_count,
    SUM(p.payment_value) AS total_payment
FROM orders o
JOIN order_payments p
    ON o.order_id = p.order_id
GROUP BY
    day_type,
    p.payment_type
ORDER BY
    day_type,
    p.payment_type;
    
/*---------Q2- Number of Orders with review score 5 and payment type as credit card.----------*/    
SELECT
    o.order_id,
    r.review_score,
    p.payment_type
FROM orders o
JOIN order_reviews r
    ON o.order_id = r.order_id
JOIN order_payments p
    ON o.order_id = p.order_id;
    
    SELECT
    COUNT(DISTINCT o.order_id) AS number_of_orders
FROM orders o
JOIN order_reviews r
    ON o.order_id = r.order_id
JOIN order_payments p
    ON o.order_id = p.order_id
WHERE r.review_score = 5
  AND p.payment_type = 'credit_card';
  
  
/*---------Q3- Average number of days taken for order_delivered_customer_date for pet_shop-----------*/
SELECT
ROUND(
AVG(
DATEDIFF(
o.order_delivered_customer_date,
o.order_purchase_timestamp
)
),2
) AS Avg_Delivery_Days
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id

JOIN products pr
ON oi.product_id = pr.product_id

JOIN product_category_name_translation t
ON pr.product_category_name = t.product_category_name

WHERE t.product_category_name_english = 'pet_shop'
AND o.order_delivered_customer_date IS NOT NULL;


/*---------Q4- Average price and payment values from customers of sao paulo city----------*/
SELECT
ROUND(AVG(oi.price),2) AS Avg_Product_Price,
ROUND(AVG(op.payment_value),2) AS Avg_Payment_Value
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id

JOIN order_items oi
ON o.order_id = oi.order_id

JOIN order_payments op
ON o.order_id = op.order_id

WHERE LOWER(c.customer_city) = 'sao paulo';

/*---------Q5-Relationship between shipping days (order_delivered_customer_date - order_purchase_timestamp) Vs review scores..----------*/
select r.review_score, count(o.order_id) AS Total_Orders,
round(avg(datediff(o.order_delivered_customer_date, o.order_purchase_timestamp)), 2) as avg_Shipping_days
from orders o
join order_reviews r ON o.order_id = r.order_id
where o.order_status = 'delivered' and o.order_delivered_customer_date IS NOT NULL
and o.order_purchase_timestamp IS NOT NULL
group by
r.review_score
order by
r.review_score;

/*---------Q6-Which product categories generate the highest total sales and number of orders?..----------*/
SELECT
    p.product_category_name,
    SUM(oi.price) AS total_sales,
    COUNT(DISTINCT oi.order_id) AS number_of_orders
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY total_sales DESC;


  /*---------Q9-Which seller states contribute the highest total sales?..----------*/

SELECT
    s.seller_state,
    SUM(oi.price) AS total_sales
FROM order_items oi
JOIN sellers s
    ON oi.seller_id = s.seller_id
GROUP BY s.seller_state
ORDER BY total_sales DESC;

--- only top 15 states---
SELECT
    s.seller_state,
    SUM(oi.price) AS total_sales
FROM order_items oi
JOIN sellers s
    ON oi.seller_id = s.seller_id
GROUP BY s.seller_state
ORDER BY total_sales DESC
LIMIT 15;









