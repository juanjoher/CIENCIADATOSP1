CREATE DATABASE IF NOT EXISTS sales_data;
USE sales_data;

CREATE TABLE payment_method (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    method_name VARCHAR(50) NOT NULL UNIQUE
);

-- Tabla de dimensiones: Centros comerciales
CREATE TABLE shopping_mall (
    Mall_id INT PRIMARY KEY AUTO_INCREMENT,
    mall_name VARCHAR(100) NOT NULL UNIQUE
);

-- Tabla de dimensiones: Fechas
CREATE TABLE Date (
    date_id INT PRIMARY KEY AUTO_INCREMENT,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL,
    UNIQUE (day, month, year) -- Evita duplicados en fechas
);

-- Tabla de dimensiones: Categorías de productos
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    UNIQUE (category, price) -- Evita duplicados de categorías con el mismo precio
);

-- Tabla de dimensiones: Clientes
CREATE TABLE client (
    customer_id INT PRIMARY KEY,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    age INT NOT NULL CHECK (age >= 0)
);

-- Tabla de hechos: Facturas
CREATE TABLE invoice (
    invoice_no INT PRIMARY KEY,
    customer_id INT NOT NULL,
    payment_id INT NOT NULL,
    Mall_id INT NOT NULL,
    date_id INT NOT NULL,
    product _id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    total_price DECIMAL(10,2) NOT NULL CHECK (total_price >= 0),
   );
