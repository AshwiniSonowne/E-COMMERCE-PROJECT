CREATE DATABASE olist_ecommerce;
USE olist_ecommerce;

/*---------create tables------------------------------------*/

CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state CHAR(2)
);

CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(30),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);

CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2)
);

CREATE TABLE order_payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(30),
    payment_installments INT,
    payment_value DECIMAL(10,2)
);

CREATE TABLE order_reviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME
);

CREATE TABLE product_category_name_translation (
    product_category_name VARCHAR(100),
    product_category_name_english VARCHAR(100)
);

CREATE TABLE products (
    product_id VARCHAR(50),
    product_category_name VARCHAR(100),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

CREATE TABLE sellers (
    seller_id VARCHAR(50),
    seller_zip_code_prefix INT,
    seller_city VARCHAR(100),
    seller_state CHAR(2)
);

CREATE TABLE geolocation (
    geolocation_zip_code_prefix INT,
    geolocation_lat DECIMAL(10,8),
    geolocation_lng DECIMAL(11,8),
    geolocation_city VARCHAR(100),
    geolocation_state CHAR(2)
);

/*-------------Load Data------------------*/

LOAD DATA LOCAL INFILE 'C:/Users/RADHIKA/Downloads/ecommerce/Project Files/olist_customers_dataset.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SET GLOBAL local_infile = 1;

SHOW VARIABLES LIKE 'local_infile';

select * from customers;
/*---------------------------------------------*/
LOAD DATA LOCAL INFILE 'C:/Users/RADHIKA/Downloads/ecommerce/Project Files/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

select * from orders;
/*---------------------------------------------*/
LOAD DATA LOCAL INFILE 'C:/Users/RADHIKA/Downloads/ecommerce/Project Files/olist_order_reviews_dataset.csv'
INTO TABLE order_reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

select * from order_reviews;
/*---------------------------------------------*/
LOAD DATA LOCAL INFILE 'C:/Users/RADHIKA/Downloads/ecommerce/Project Files/olist_geolocation_dataset.csv'
INTO TABLE geolocation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

select * from geolocation;
/*---------------------------------------------*/
LOAD DATA LOCAL INFILE 'C:/Users/RADHIKA/Downloads/ecommerce/Project Files/olist_order_items_dataset.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

select * from order_items;
/*---------------------------------------------*/
LOAD DATA LOCAL INFILE 'C:/Users/RADHIKA/Downloads/ecommerce/Project Files/olist_order_payments_dataset.csv'
INTO TABLE order_payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

select * from order_payments;
/*---------------------------------------------*/
LOAD DATA LOCAL INFILE 'C:/Users/RADHIKA/Downloads/ecommerce/Project Files/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

select * from products;
/*---------------------------------------------*/
LOAD DATA LOCAL INFILE 'C:/Users/RADHIKA/Downloads/ecommerce/Project Files/olist_sellers_dataset.csv'
INTO TABLE sellers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

select * from sellers;
/*---------------------------------------------*/
LOAD DATA LOCAL INFILE 'C:/Users/RADHIKA/Downloads/ecommerce/Project Files/product_category_name_translation.csv'
INTO TABLE product_category_name_translation
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

select * from product_category_name_translation;



