-- Products Table
CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    category TEXT,
    price DECIMAL(10,2)
);

-- Sales Table
CREATE TABLE Sales (
    sale_id INTEGER PRIMARY KEY,
    product_id INTEGER,
    sale_date DATE,
    quantity INTEGER,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Reviews Table
CREATE TABLE Reviews (
    review_id INTEGER PRIMARY KEY,
    product_id INTEGER,
    customer_id INTEGER,
    rating INTEGER,
    comment TEXT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Market Trends Table
CREATE TABLE MarketTrends (
    trend_id INTEGER PRIMARY KEY,
    product_id INTEGER,
    date DATE,
    mentions_count INTEGER,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);



INSERT INTO Products (product_id, name, category, price) VALUES
(1, 'Smart Watch', 'Electronics', 200.00),
(2, 'Wireless Headphones', 'Electronics', 120.00);

INSERT INTO Sales (sale_id, product_id, sale_date, quantity) VALUES
(1, 1, '2024-03-10', 50),
(2, 2, '2024-03-12', 30);

INSERT INTO Reviews (review_id, product_id, customer_id, rating, comment) VALUES
(1, 1, 1, 4, 'Great product!'),
(2, 2, 2, 5, 'Excellent sound quality');

INSERT INTO MarketTrends (trend_id, product_id, date, mentions_count) VALUES
(1, 1, '2024-03-10', 500),
(2, 2, '2024-03-12', 300);

SELECT 
    p.name AS product_name,
    SUM(s.quantity) AS total_sales
FROM Products p
JOIN Sales s ON p.product_id = s.product_id
GROUP BY p.product_id
ORDER BY total_sales DESC;


SELECT 
    p.name AS product_name,
    AVG(r.rating) AS average_rating
FROM Products p
JOIN Reviews r ON p.product_id = r.product_id
GROUP BY p.product_id;


SELECT 
    p.name AS product_name,
    mt.date,
    mt.mentions_count
FROM MarketTrends mt
JOIN Products p ON mt.product_id = p.product_id
ORDER BY mt.mentions_count DESC;
