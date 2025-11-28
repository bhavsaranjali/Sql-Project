-- E-Commerce Database Simulation
CREATE DATABASE ecommerce_db;
USE ecommerce_db;


CREATE TABLE users (
  user_id INT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(150) UNIQUE,
  phone VARCHAR(20),
  date_of_birth DATE,
  gender VARCHAR(10),
  created_at DATETIME,
  updated_at DATETIME
);
CREATE TABLE categories (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(100) UNIQUE,
  parent_category_id INT,
  created_at DATETIME,
  updated_at DATETIME,
  FOREIGN KEY (parent_category_id) REFERENCES categories(category_id)
);
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  name VARCHAR(150),
  description TEXT,
  price DECIMAL(10,2),
  stock_quantity INT,
  category_id INT,
  created_at DATETIME,
  updated_at DATETIME,
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  user_id INT,
  order_date DATETIME,
  status VARCHAR(50),
  total_amount DECIMAL(12,2),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);
CREATE TABLE order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  price_at_purchase DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE payments (
  payment_id INT PRIMARY KEY,
  order_id INT,
  payment_date DATETIME,
  amount DECIMAL(12,2),
  payment_method VARCHAR(50),
  status VARCHAR(50),
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
CREATE TABLE reviews (
  review_id INT PRIMARY KEY,
  user_id INT,
  product_id INT,
  rating INT CHECK (rating BETWEEN 1 AND 5),
  comment TEXT,
  review_date DATETIME,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE shipping (
  shipping_id INT PRIMARY KEY,
  order_id INT,
  shipping_address VARCHAR(255),
  city VARCHAR(100),
  state VARCHAR(100),
  pincode VARCHAR(10),
  shipped_date DATETIME,
  delivered_date DATETIME,
  shipping_status VARCHAR(50),
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
INSERT INTO Users (user_id,name, email, phone, date_of_birth, gender, created_at, updated_at)
VALUES
(1,'Aarav Sharma', 'aarav.sharma@example.in', '+91-9876543210', '1995-03-15', 'Male', '2023-01-10 10:15:00', '2023-01-15 14:30:00'),
(2,'Priya Patel', 'priya.patel@example.in', '+91-9823456789', '1992-07-20', 'Female', '2023-02-05 09:10:00', '2023-02-08 16:45:00'),
(3,'Rohan Verma', 'rohan.verma@example.in', '+91-9765432189', '1998-11-05', 'Male', '2023-03-12 08:55:00', '2023-03-18 11:20:00'),
(4,'Sneha Iyer', 'sneha.iyer@example.in', '+91-9845012345', '1996-02-28', 'Female', '2023-04-01 12:00:00', '2023-04-04 18:30:00'),
(5,'Vikram Singh', 'vikram.singh@example.in', '+91-9934567890', '1990-09-12', 'Male', '2023-05-20 15:45:00', '2023-05-25 09:10:00'),
(6,'Neha Gupta', 'neha.gupta@example.in', '+91-9811122233', '1994-12-30', 'Female', '2023-06-14 11:00:00', '2023-06-17 13:40:00'),
(7,'Rahul Nair', 'rahul.nair@example.in', '+91-9998877665', '1989-06-10', 'Male', '2023-07-02 10:20:00', '2023-07-09 19:25:00'),
(8,'Ananya Das', 'ananya.das@example.in', '+91-9877001122', '1997-04-25', 'Female', '2023-08-08 09:35:00', '2023-08-12 17:10:00'),
(9,'Arjun Mehta', 'arjun.mehta@example.in', '+91-9822099887', '1993-01-18', 'Male', '2023-09-05 14:00:00', '2023-09-10 11:50:00'),
(10,'Kavya Reddy', 'kavya.reddy@example.in', '+91-9845678901', '1999-08-09', 'Female', '2023-10-15 08:45:00', '2023-10-18 15:55:00'),
(11,'Ishita Kapoor', 'ishita.kapoor@example.in', '+91-9812345671', '1991-11-02', 'Female', '2023-11-20 10:00:00', '2023-11-25 16:30:00'),
(12,'Manish Yadav', 'manish.yadav@example.in', '+91-9876123456', '1988-05-14', 'Male', '2023-12-05 09:40:00', '2023-12-10 13:15:00'),
(13,'Divya Menon', 'divya.menon@example.in', '+91-9888007766', '1995-09-23', 'Female', '2024-01-08 11:25:00', '2024-01-12 18:10:00'),
(14,'Siddharth Rao', 'siddharth.rao@example.in', '+91-9945123987', '1993-04-18', 'Male', '2024-02-20 08:55:00', '2024-02-24 14:50:00'),
(15,'Pooja Bansal', 'pooja.bansal@example.in', '+91-9812233445', '1996-06-30', 'Female', '2024-03-15 15:20:00', '2024-03-19 17:35:00'),
(16,'Aditya Joshi', 'aditya.joshi@example.in', '+91-9899011223', '1994-08-22', 'Male', '2024-04-09 10:05:00', '2024-04-14 11:45:00'),
(17,'Meera Chawla', 'meera.chawla@example.in', '+91-9823445566', '1998-10-12', 'Female', '2024-05-05 09:50:00', '2024-05-10 15:30:00'),
(18,'Harshit Tiwari', 'harshit.tiwari@example.in', '+91-9844556677', '1992-03-27', 'Male', '2024-06-10 14:10:00', '2024-06-15 19:00:00'),
(19,'Tanvi Bhattacharya', 'tanvi.bhattacharya@example.in', '+91-9866112233', '1997-02-04', 'Female', '2024-07-12 12:40:00', '2024-07-17 18:20:00'),
(20,'Karan Malhotra', 'karan.malhotra@example.in', '+91-9877009988', '1990-01-29', 'Male', '2024-08-01 16:15:00', '2024-08-06 20:10:00');

INSERT INTO categories (category_id,category_name,parent_category_id,created_at,updated_at) 
VALUES (1,'Electronics',NULL,'2023-01-06 00:00:00','2023-05-04 00:00:00'),
 (2,'Mobiles',1,'2023-03-08 00:00:00','2023-08-02 00:00:00'),
 (3,'Laptops',1,'2023-06-03 00:00:00','2023-10-25 00:00:00'),
 (4,'Home Appliances',NULL,'2023-06-16 00:00:00','2024-02-03 00:00:00'),
(5,'Fashion',NULL,'2023-11-17 00:00:00','2023-12-23 00:00:00'),
(6,'Men Clothing',5,'2023-11-18 00:00:00','2024-03-16 00:00:00'),
(7,'Women Clothing',5,'2023-12-22 00:00:00','2024-05-05 00:00:00'),
(8,'Beauty',NULL,'2024-03-01 00:00:00','2024-06-10 00:00:00'),
(9,'Books',NULL,'2024-03-08 00:00:00','2024-10-11 00:00:00'),
(10,'Toys',NULL,'2024-05-06 00:00:00','2024-07-03 00:00:00'),
(11,'Sports',NULL,'2024-06-25 00:00:00','2025-03-30 00:00:00'),
 (12,'Grocery',NULL,'2024-08-19 00:00:00','2024-12-12 00:00:00'),
 (13,'Furniture',NULL,'2025-04-16 00:00:00','2025-07-01 00:00:00'),
(14,'Accessories',NULL,'2025-07-11 00:00:00','2025-11-24 00:00:00'),
 (15,'Gaming',NULL,'2025-08-20 00:00:00','2025-10-31 00:00:00');
 
 
INSERT INTO products (product_id,name,description,price,stock_quantity,category_id,created_at,updated_at)
 VALUES (1,'Product_1','Description for Product_1',6533.15,197,7,'2023-02-12 00:00:00','2023-11-02 00:00:00'),
 (2,'Product_2','Description for Product_2',16516.05,0,11,'2023-02-22 00:00:00','2023-11-26 00:00:00'),
(3,'Product_3','Description for Product_3',9293.33,13,4,'2023-03-17 00:00:00','2023-12-07 00:00:00'),
 (4,'Product_4','Description for Product_4',7299.41,193,8,'2023-03-23 00:00:00','2024-02-06 00:00:00'),
  (5,'Product_5','Description for Product_5',8896.62,13,4,'2023-03-24 00:00:00','2023-08-07 00:00:00'),
 (6,'Product_6','Description for Product_6',11029.47,73,8,'2023-05-03 00:00:00','2024-04-24 00:00:00'),
 (7,'Product_7','Description for Product_7',9745.76,7,11,'2023-05-27 00:00:00','2024-04-02 00:00:00'),
 (8,'Product_8','Description for Product_8',16006.34,181,3,'2023-06-14 00:00:00','2023-11-20 00:00:00'),
 (9,'Product_9','Description for Product_9',11061.7,141,7,'2023-06-30 00:00:00','2023-08-16 00:00:00'),
(10,'Product_10','Description for Product_10',4571.54,29,8,'2023-07-06 00:00:00','2023-09-04 00:00:00'),
(11,'Product_11','Description for Product_11',12989.42,39,8,'2023-07-07 00:00:00','2024-07-07 00:00:00'),
 (12,'Product_12','Description for Product_12',5908.05,180,5,'2023-08-03 00:00:00','2024-03-02 00:00:00'),
 (13,'Product_13','Description for Product_13',16711.01,120,4,'2023-09-12 00:00:00','2024-05-02 00:00:00'), 
(14,'Product_14','Description for Product_14',11070.18,98,4,'2023-11-26 00:00:00','2024-09-27 00:00:00'),
 (15,'Product_15','Description for Product_15',10213.99,34,14,'2023-12-06 00:00:00','2024-01-10 00:00:00'),
 (16,'Product_16','Description for Product_16',5597.32,106,6,'2023-12-25 00:00:00','2024-09-09 00:00:00'),
(17,'Product_17','Description for Product_17',5416.74,0,5,'2024-01-07 00:00:00','2025-01-12 00:00:00'),
(18,'Product_18','Description for Product_18',6041.26,150,10,'2024-04-13 00:00:00','2025-03-16 00:00:00'),
 (19,'Product_19','Description for Product_19',9843.84,38,8,'2024-05-27 00:00:00','2025-02-26 00:00:00'),
 (20,'Product_20','Description for Product_20',9738.39,85,9,'2024-05-31 00:00:00','2025-06-25 00:00:00');

INSERT INTO orders (order_id,user_id,order_date,status,total_amount) 
VALUES (1,20,'2023-01-17 00:00:00','Returned',31550.01),
 (2,8,'2023-01-29 00:00:00','Returned',7432.71),
 (3,17,'2023-02-14 00:00:00','Cancelled',0.0),
 (4,15,'2023-03-10 00:00:00','Returned',9143.08),
 (5,4,'2023-03-22 00:00:00','Pending',16675.54),
 (6,14,'2023-04-11 00:00:00','Processing',25996.62),
 (7,13,'2023-06-04 00:00:00','Pending',97657.19),
(8,10,'2023-07-04 00:00:00','Cancelled',72502.93),
 (9,12,'2023-07-18 00:00:00','Cancelled',0.0),
 (10,11,'2023-08-07 00:00:00','Returned',44831.83),
(11,5,'2023-08-24 00:00:00','Returned',57395.72),
(12,1,'2023-09-11 00:00:00','Returned',16311.39),
 (13,3,'2023-09-27 00:00:00','Returned',0.0),
(14,2,'2023-09-28 00:00:00','Pending',0.0),
(15,9,'2023-10-08 00:00:00','Pending',98091.4),
(16,16,'2023-10-16 00:00:00','Shipped',0.0),
 (17,18,'2023-12-03 00:00:00','Pending',0.0),
 (18,19,'2023-12-26 00:00:00','Processing',0.0),
 (19,6,'2024-01-25 00:00:00','Processing',37558.68),
 (20,7,'2024-02-16 00:00:00','Delivered',0.0);


INSERT INTO order_items (order_item_id,order_id,product_id,quantity,price_at_purchase) 
VALUES (1,5,8,5,15206.02),
(2,8,9,2,15485.12),
(3,2,3,4,7019.78),
(4,4,7,3,8283.9),
(5,1,4,3,1504.32),
(6,10,14,4,4892.51),
(7,6,6,1,9375.05),
(8,7,8,3,17964.68),
(9,6,15,5,6569.47),
(10,11,18,4,14405.71),
(11,13,19,4,19244.38),
(12,19,11,3,12519.56),
(13,7,17,5,1803.62),
(14,10,13,4,1587.9),
(15,7,2,5,6949.01),
(16,8,7,3,18282.16),
(17,18,16,5,13719.55),
(18,19,5,3,1671.47),
(19,12,20,3,5437.13),
(20,9,1,2,6206.49);

INSERT INTO payments (payment_id,order_id,payment_date,amount,payment_method,status) 
VALUES (1,4,'2023-03-19 00:00:00',23410.8,'NetBanking','Failed'),
 (2,2,'2023-03-22 00:00:00',14607.58,'UPI','Refunded'),
 (3,7,'2023-03-26 00:00:00',17809.72,'Wallet','Success'),
 (4,1,'2023-04-26 00:00:00',0.0,'Credit Card','Pending'),
(5,17,'2023-04-27 00:00:00',73242.89,'UPI','Pending'),
(6,14,'2023-05-07 00:00:00',24851.7,'UPI','Success'),
 (7,8,'2023-05-20 00:00:00',0.0,'UPI','Pending'),
 (8,3,'2023-06-01 00:00:00',0.0,'Debit Card','Success'),
(9,20,'2023-06-04 00:00:00',0.0,'UPI','Failed'),
 (10,13,'2023-06-07 00:00:00',194088.08,'NetBanking','Pending'),
 (11,5,'2023-06-22 00:00:00',3716.36,'UPI','Failed'),
 (12,18,'2023-07-04 00:00:00',0.0,'NetBanking','Failed'),
(13,15,'2023-07-30 00:00:00',98091.4,'Debit Card','Success'),
 (14,19,'2023-07-31 00:00:00',37558.68,'Wallet','Success'),
 (15,11,'2023-10-27 00:00:00',97044.04,'Wallet','Failed'),
 (16,9,'2023-11-05 00:00:00',3760.81,'Debit Card','Failed'),
 (17,12,'2023-11-06 00:00:00',16311.39,'NetBanking','Success'),
 (18,7,'2023-11-10 00:00:00',17809.72,'Debit Card','Refunded'),
(19,10,'2023-12-20 00:00:00',0.0,'NetBanking','Failed'),
 (20,16,'2023-12-22 00:00:00',0.0,'UPI','Refunded');

INSERT INTO reviews (review_id,user_id,product_id,rating,comment,review_date)
 VALUES (1,1,4,1,'Review 1 for product 4','2023-03-16 00:00:00'),
 (2,3,1,4,'Review 2 for product 41','2023-03-27 00:00:00'),
(3,4,3,2,'Review 3 for product 33','2023-03-28 00:00:00'),
 (4,2,10,5,'Review 4 for product 10','2023-03-31 00:00:00'),
 (5,14,9,1,'Review 5 for product 29','2023-04-08 00:00:00'),
 (6,9,5,2,'Review 6 for product 5','2023-06-11 00:00:00'),
(7,5,12,3,'Review 7 for product 42','2023-06-13 00:00:00'),
 (8,14,15,5,'Review 8 for product 25','2023-06-19 00:00:00'),
 (9,13,19,2,'Review 9 for product 39','2023-07-30 00:00:00'),
 (10,17,20,3,'Review 10 for product 29','2023-09-12 00:00:00'),
 (11,14,17,1,'Review 11 for product 29','2023-12-08 00:00:00'),
 (12,10,11,5,'Review 12 for product 9','2024-01-05 00:00:00'),
(13,20,16,3,'Review 13 for product 26','2024-01-18 00:00:00'),
  (16,18,19,4,'Review 16 for product 34','2024-02-17 00:00:00'),
 (17,16,8,3,'Review 17 for product 8','2024-06-02 00:00:00'),
(18,15,13,4,'Review 18 for product 17','2024-06-30 00:00:00'),
 (19,14,8,3,'Review 19 for product 40','2024-07-13 00:00:00'),
(20,11,7,2,'Review 20 for product 32','2024-07-16 00:00:00');

INSERT INTO shipping (shipping_id,order_id,shipping_address,city,state,pincode,shipped_date,delivered_date,shipping_status) 
VALUES (1,20,'82 Main Street','Jaipur','Uttar Pradesh','484034','2023-03-05 00:00:00','2023-03-11 00:00:00','In Transit'),
 (2,16,'25 Main Street','Mumbai','Tamil Nadu','486458','2023-03-06 00:00:00','2023-03-16 00:00:00','Delivered'),
 (3,8,'207 Main Street','Pune','Maharashtra','451505','2023-03-28 00:00:00','2023-04-02 00:00:00','Delivered'),
 (4,9,'61 Main Street','Bengaluru','Delhi','373971','2023-04-09 00:00:00','2023-04-14 00:00:00','Returned'),
 (5,13,'24 Main Street','Mumbai','Karnataka','785181','2023-04-18 00:00:00','2023-04-27 00:00:00','Shipped'),
 (6,10,'154 Main Street','Ahmedabad','Maharashtra','554540','2023-05-06 00:00:00','2023-05-09 00:00:00','Pending'),
 (7,12,'299 Main Street','Chennai','Maharashtra','526952','2023-06-05 00:00:00','2023-06-07 00:00:00','Pending'),
 (8,4,'269 Main Street','Ahmedabad','West Bengal','160910','2023-06-21 00:00:00','2023-06-29 00:00:00','In Transit'),
(9,11,'105 Main Street','Kolkata','Uttar Pradesh','798701','2023-07-22 00:00:00','2023-07-25 00:00:00','Pending'),
 (10,14,'270 Main Street','Kolkata','Maharashtra','945568','2023-08-11 00:00:00','2023-08-17 00:00:00','Pending'),
 (11,4,'248 Main Street','Hyderabad','Telangana','229977','2023-09-14 00:00:00','2023-09-19 00:00:00','Returned'),
 (12,15,'246 Main Street','Pune','Uttar Pradesh','972163','2023-10-01 00:00:00','2023-10-09 00:00:00','Delivered'),
(13,6,'149 Main Street','Mumbai','Tamil Nadu','909672','2023-10-23 00:00:00','2023-10-29 00:00:00','In Transit'),
 (14,1,'71 Main Street','Delhi','Gujarat','720922','2023-10-25 00:00:00','2023-11-03 00:00:00','Delivered'),
 (15,7,'52 Main Street','Bengaluru','Maharashtra','991684','2023-11-16 00:00:00','2023-11-22 00:00:00','Pending'),
(16,2,'147 Main Street','Mumbai','Delhi','627809','2023-11-22 00:00:00','2023-11-27 00:00:00','Delivered'),
(17,3,'204 Main Street','Jaipur','Karnataka','999805','2023-12-01 00:00:00','2023-12-04 00:00:00','Shipped'),
 (18,5,'279 Main Street','Lucknow','Rajasthan','815283','2023-12-20 00:00:00','2023-12-25 00:00:00','Pending'),
(19,6,'8 Main Street','Pune','Tamil Nadu','571888','2024-02-26 00:00:00','2024-03-02 00:00:00','In Transit'),
(20,10,'49 Main Street','Bengaluru','Karnataka','490342','2024-03-10 00:00:00','2024-03-12 00:00:00','Pending');


CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_order_items_product_id ON order_items(product_id);


select * from Products;

select * from  products 
where price > 
  (select avg(price) from  products )
  ;
select * from order_items;

select p.name 
from products p
join order_items oi 
on p.product_id = oi.Product_id
where oi.order_item_id = 3 ;

-- 1. BASIC RETRIEVAL & FILTERING

-- 1.a List all users who signed up in the last 30 days
SELECT * FROM users
WHERE created_at >= NOW() - INTERVAL 30 DAY;

-- 1.b Find products with price > 1000 and in stock
SELECT * FROM products
WHERE price > 1000 AND stock_quantity > 0
ORDER BY price DESC;

-- 1.c Sort orders by total_amount descending
SELECT * FROM orders
ORDER BY total_amount DESC;

-- 2. AGGREGATION & GROUPING

-- 2.a Total sales (sum of quantity*price_at_purchase) per category
SELECT c.category_id, c.category_name, SUM(oi.quantity * oi.price_at_purchase) AS total_sales
FROM categories c
JOIN products p ON p.category_id = c.category_id
JOIN order_items oi ON oi.product_id = p.product_id
GROUP BY c.category_id, c.category_name
ORDER BY total_sales DESC;

-- 2.b Average rating per product
SELECT p.product_id, p.name, AVG(r.rating) AS avg_rating, COUNT(r.review_id) AS review_count
FROM products p
LEFT JOIN reviews r ON r.product_id = p.product_id
GROUP BY p.product_id, p.name
ORDER BY avg_rating DESC;

-- 2.c Number of orders per user in the last month
SELECT o.user_id, u.name, COUNT(o.order_id) AS orders_count
FROM orders o
JOIN users u ON u.user_id = o.user_id
WHERE o.order_date >= NOW() - INTERVAL 30 DAY
GROUP BY o.user_id, u.name
ORDER BY orders_count DESC;

-- 3. JOINS

-- 3.a INNER JOIN users and orders to get user orders (most recent first)
SELECT o.order_id, o.user_id, u.name, u.email, o.order_date, o.status, o.total_amount
FROM orders o
INNER JOIN users u ON u.user_id = o.user_id
ORDER BY o.order_date DESC;

-- 3.b LEFT JOIN products with reviews to find products with no reviews
SELECT p.product_id, p.name, p.category_id
FROM products p
LEFT JOIN reviews r ON r.product_id = p.product_id
WHERE r.review_id IS NULL;

-- 3.c SELF JOIN on categories to show parent-child relationships
SELECT c.category_id AS child_id, c.category_name AS child_name,
       p.category_id AS parent_id, p.category_name AS parent_name
FROM categories c
LEFT JOIN categories p ON c.parent_category_id = p.category_id
ORDER BY parent_name, child_name;

-- 4. SUBQUERIES

-- 4.a Find products with a price higher than the average price of their category.
SELECT p.*
FROM products p
WHERE p.price > (
  SELECT AVG(p2.price) FROM products p2 WHERE p2.category_id = p.category_id
);

-- 4.b List users who made more than 5 orders last month
SELECT o.user_id, u.name, COUNT(o.order_id) AS orders_count
FROM orders o
JOIN users u ON u.user_id = o.user_id
WHERE o.order_date >= NOW() - INTERVAL 30 DAY
GROUP BY o.user_id, u.name
HAVING COUNT(o.order_id) > 5;

-- 5. CTEs & VIEWS

-- 5.a CTE for monthly sales (YYYY-MM)
WITH monthly_sales AS (
  SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS month_year,
         SUM(oi.quantity * oi.price_at_purchase) AS sales
  FROM orders o
  JOIN order_items oi ON oi.order_id = o.order_id
  GROUP BY month_year
)
SELECT * FROM monthly_sales
ORDER BY month_year DESC;

-- 5.b Create a view for top_selling_products (top 10 by quantity sold)
CREATE OR REPLACE VIEW top_selling_products AS
SELECT oi.product_id, p.name, SUM(oi.quantity) AS total_qty
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
GROUP BY oi.product_id, p.name
ORDER BY total_qty DESC
LIMIT 10;

-- 6. OPERATORS & FUNCTIONS

-- 6.a Clean user emails (example update)
UPDATE users
SET email = LOWER(TRIM(email))
WHERE email IS NOT NULL;

-- 6.b Find shipments delivered more than 7 days after shipped_date (shipped late)
SELECT *
FROM shipping 
WHERE DATEDIFF(delivered_date, shipped_date) > 7;

-- 6.c Calculate discounted price (10% off) for products with price > 10000
SELECT product_id, name, price,
       CASE 
       WHEN price > 10000 THEN price * 0.9
       ELSE price
       END AS discounted_price
FROM products;

-- 7. CONSTRAINTS & DESIGN (examples to verify constraints)

-- 7.a Show products where foreign key to category is missing (should be none if referential integrity held)
SELECT p.*
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id
WHERE c.category_id IS NULL;

-- 8. PERFORMANCE (example queries that benefit from indexes)

-- 8.a Frequent lookup: find orders by a specific user (use index idx_orders_user_id)
SELECT * FROM orders
WHERE user_id = 1
ORDER BY order_date DESC;

-- 8.b Frequent lookup: find order_items for a product (use idx_order_items_product_id)
SELECT oi.*
FROM order_items oi
WHERE oi.product_id = 1;

-- 9. TEMPORARY TABLES & TRANSACTIONS (examples)

-- 9.a Use a temporary table to compute daily revenue (example)
CREATE TEMPORARY TABLE temp_daily_revenue AS
SELECT DATE(o.order_date) AS order_day, SUM(oi.quantity * oi.price_at_purchase) AS revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY order_day;
SELECT * FROM temp_daily_revenue ORDER BY order_day DESC LIMIT 30;

-- 9.b Example transaction for safe order placement (pseudo-variables shown)
-- START TRANSACTION;
-- -- check stock, reduce stock, create order, insert order_items, create payment
-- COMMIT;
