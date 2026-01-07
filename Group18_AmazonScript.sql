-- AMAZON PROJECT GROUP 18 : AYUSHIE GUPTA(341005), PURVA TYAGI(341041), RADHIKA KHATTAR(341043)--

create database if not exists amazon18_db;
USE amazon18_db;
CREATE TABLE IF NOT EXISTS Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(25) NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    phone CHAR(10),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    hashed_password CHAR(20) NOT NULL
);
CREATE TABLE IF NOT EXISTS Address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    street_line_1 VARCHAR(50) NOT NULL,
    city VARCHAR(20) NOT NULL,
    zip_code VARCHAR(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
CREATE TABLE IF NOT EXISTS SalesOrder (
    order_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    shipping_address_id INT NOT NULL,
    order_datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10,2) NOT NULL,
    status TINYINT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    FOREIGN KEY (shipping_address_id) REFERENCES Address(address_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
INSERT IGNORE INTO Customer (full_name, email, phone, hashed_password)
VALUES
('Ayushi Gupta', 'ayushigupta@mail.com', '9876543210', 'hash1'),
('Purva tyagi', 'p.tyagi@mail.com', '9123456780', 'hash2');
INSERT IGNORE INTO Address (customer_id, street_line_1, city, zip_code)
VALUES
(1, '123 Main St', 'Delhi', '98101'),
(2, '45 Church Road', 'Bangalore', '10001');
INSERT IGNORE INTO SalesOrder (customer_id, shipping_address_id, total_amount, status)
VALUES
(1, 1, 2500.50, 1),
(2, 2, 1200.00, 1);
SELECT * FROM Customer;
SELECT * FROM Address;
SELECT * FROM SalesOrder;

-- Category Table
CREATE TABLE IF NOT EXISTS Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(200)
);

-- Product Table
CREATE TABLE IF NOT EXISTS Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    status TINYINT NOT NULL DEFAULT 1,  -- 1 = Active, 0 = Inactive
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- Warehouse Table
CREATE TABLE IF NOT EXISTS Warehouse (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- Inventory Table (N:M relationship between Product and Warehouse)
CREATE TABLE IF NOT EXISTS Inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    stock_quantity SMALLINT NOT NULL,
    UNIQUE (product_id, warehouse_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (warehouse_id) REFERENCES Warehouse(warehouse_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

INSERT IGNORE INTO Category (category_name, description)
VALUES
('Electronics', 'Electronic gadgets and accessories'),
('Books', 'Printed and digital books');

INSERT IGNORE INTO Product (category_id, product_name, price, status)
VALUES
(1, 'Wireless Headphones', 2999.99, 1),
(2, 'Database Management Book', 899.50, 1);

INSERT IGNORE INTO Warehouse (warehouse_name, city)
VALUES
('Gurugram Central Warehouse', 'Gurugram'),
('Mumbai Distribution Center', 'Mumbai');

INSERT IGNORE INTO Inventory (product_id, warehouse_id, stock_quantity)
VALUES
(1, 1, 120),
(1, 2, 80),
(2, 2, 50);

SELECT * FROM Category;
SELECT * FROM Product;
SELECT * FROM Warehouse;
SELECT * FROM Inventory;

CREATE TABLE IF NOT EXISTS OrderItem (
    order_item_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT NOT NULL,
    product_id INT NOT NULL,
    quantity SMALLINT NOT NULL,
    item_price DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (order_id) REFERENCES SalesOrder(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (product_id) REFERENCES Product(product_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    UNIQUE (order_id, product_id)
);

CREATE TABLE IF NOT EXISTS Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    rating TINYINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_text VARCHAR(300),
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    FOREIGN KEY (product_id) REFERENCES Product(product_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    UNIQUE (customer_id, product_id)
);

INSERT IGNORE INTO OrderItem (order_id, product_id, quantity, item_price)
VALUES
(1, 1, 1, 2999.99),
(2, 2, 1, 899.50);

INSERT IGNORE INTO Review (customer_id, product_id, rating, review_text)
VALUES
(1, 1, 5, 'Excellent sound quality'),
(2, 2, 4, 'Very helpful for learning database concepts');

SELECT * FROM OrderItem;
SELECT * FROM Review;
