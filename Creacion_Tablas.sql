CREATE DATABASE IF NOT EXISTS sales_data;
USE sales_data;

CREATE TABLE payment_method (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE shopping_mall (
    mall_id INT PRIMARY KEY AUTO_INCREMENT,
    mall_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE date (
    date_id INT PRIMARY KEY AUTO_INCREMENT,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL,
    UNIQUE (day, month, year)
);

CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),
    UNIQUE (category, unit_price)
);

CREATE TABLE client (
    customer_id INT PRIMARY KEY,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    age INT NOT NULL CHECK (age >= 0)
);

CREATE TABLE invoice (
    invoice_no INT PRIMARY KEY,
    customer_id INT NOT NULL,
    payment_id INT NOT NULL,
    mall_id INT NOT NULL,
    date_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    total_price DECIMAL(10,2) NOT NULL CHECK (total_price >= 0),
    FOREIGN KEY (customer_id) REFERENCES client(customer_id),
    FOREIGN KEY (payment_id) REFERENCES payment_method(payment_id),
    FOREIGN KEY (mall_id) REFERENCES shopping_mall(mall_id),
    FOREIGN KEY (date_id) REFERENCES date(date_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);
