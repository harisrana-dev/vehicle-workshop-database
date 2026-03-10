-- Create database and use it
CREATE DATABASE VehicleServiceWorkshop;
USE VehicleServiceWorkshop;

-- Tables
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(255),
    email VARCHAR(100)
);

CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY,
    customer_id INT,
    make VARCHAR(50),
    model VARCHAR(50),
    year INT,
    registration_number VARCHAR(20) UNIQUE,
    vehicle_type VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE mechanics (
    mechanic_id INT PRIMARY KEY,
    name VARCHAR(100),
    phone VARCHAR(15),
    specialization VARCHAR(50)
);

CREATE TABLE services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100),
    service_description VARCHAR(255),
    base_price DECIMAL(10,2)
);

CREATE TABLE service_orders (
    order_id INT PRIMARY KEY,
    vehicle_id INT,
    mechanic_id INT,
    service_date DATE,
    status VARCHAR(20),
    notes VARCHAR(255),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
    FOREIGN KEY (mechanic_id) REFERENCES mechanics(mechanic_id)
);

CREATE TABLE service_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    service_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES service_orders(order_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT UNIQUE,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES service_orders(order_id)
);

-- Alter/Modify
ALTER TABLE customers ADD COLUMN new_email VARCHAR(100);
ALTER TABLE customers MODIFY phone VARCHAR(20);
ALTER TABLE vehicles MODIFY registration_number VARCHAR(50) NOT NULL;
ALTER TABLE mechanics DROP COLUMN specialization;

-- Indexes
CREATE INDEX idx_vehicle_customer ON vehicles(customer_id);
CREATE INDEX idx_service_order_vehicle ON service_orders(vehicle_id);
CREATE INDEX idx_service_order_mechanic ON service_orders(mechanic_id);
CREATE INDEX idx_service_items_order ON service_items(order_id);
CREATE INDEX idx_payment_order ON payments(order_id);
