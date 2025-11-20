CREATE database Product;
use product;
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(100),
    price DECIMAL(10,2)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);
-- Đếm số lượng sản phẩm trong mỗi danh mục
SELECT category, COUNT(*) AS number_of_products
FROM Products
GROUP BY category;
-- Tổng doanh thu cho mỗi khách hàng
SELECT customer_id, SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id;
-- Thống kê nhiều chỉ số cho từng danh mục sản phẩm
SELECT category, COUNT(*) AS product_count, AVG(price) AS avg_price, MAX(price) AS max_price, MIN(price) AS min_price
FROM Products
GROUP BY category;
-- Khách hàng có tổng chi tiêu > 1000
SELECT customer_id, SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id
HAVING SUM(total_amount) > 1000;
-- Các danh mục có nhiều hơn 5 sản phẩm
SELECT category, COUNT(*) AS product_count
FROM Products
GROUP BY category
HAVING COUNT(*) > 5;
-- 3 khách hàng chi tiêu cao nhất
SELECT customer_id, SUM(total_amount) AS total_spent
FROM Orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 3;

