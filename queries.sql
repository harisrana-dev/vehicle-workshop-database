-- Simple select
SELECT * FROM customers;

-- Customers and their vehicles
SELECT c.name, v.make, v.model, v.registration_number
FROM customers c
JOIN vehicles v ON c.customer_id = v.customer_id;

-- Service orders with vehicle number and mechanic
SELECT so.order_id, v.registration_number, m.name AS mechanic, so.status
FROM service_orders so
JOIN vehicles v ON so.vehicle_id = v.vehicle_id
JOIN mechanics m ON so.mechanic_id = m.mechanic_id;

-- Services in each order
SELECT so.order_id, s.service_name, si.quantity, si.price
FROM service_orders so
JOIN service_items si ON so.order_id = si.order_id
JOIN services s ON si.service_id = s.service_id;

-- Total bill for each order
SELECT so.order_id, SUM(si.quantity * si.price) AS total_bill
FROM service_orders so
JOIN service_items si ON so.order_id = si.order_id
GROUP BY so.order_id;

-- Payment details
SELECT so.order_id, p.amount, p.payment_method, p.payment_date
FROM service_orders so
JOIN payments p ON so.order_id = p.order_id;

-- Customers with more than one vehicle
SELECT customer_id
FROM vehicles
GROUP BY customer_id
HAVING COUNT(vehicle_id) > 1;

-- Pending service orders
SELECT * FROM service_orders
WHERE status = 'pending';

-- Update order status
UPDATE service_orders
SET status = 'completed'
WHERE order_id = 102;

-- Delete dependent service items and service
DELETE FROM service_items
WHERE service_id = 3;

DELETE FROM services
WHERE service_id = 3;

-- Views
CREATE VIEW customer_vehicle_view AS
SELECT c.customer_id, c.name, v.make, v.model, v.registration_number
FROM customers c
JOIN vehicles v ON c.customer_id = v.customer_id;

SELECT * FROM customer_vehicle_view;

CREATE VIEW service_order_details AS
SELECT so.order_id, v.registration_number, m.name AS mechanic, so.status, so.service_date
FROM service_orders so
JOIN vehicles v ON so.vehicle_id = v.vehicle_id
JOIN mechanics m ON so.mechanic_id = m.mechanic_id;

SELECT * FROM service_order_details;

CREATE VIEW order_total_bill AS
SELECT so.order_id, SUM(si.quantity * si.price) AS total_bill
FROM service_orders so
JOIN service_items si ON so.order_id = si.order_id
GROUP BY so.order_id;

SELECT * FROM order_total_bill;

-- Aggregate functions
SELECT COUNT(*) AS total_orders FROM service_orders;
SELECT AVG(amount) AS average_payment FROM payments;

-- Group by with having
SELECT mechanic_id, COUNT(order_id) AS total_orders
FROM service_orders
GROUP BY mechanic_id
HAVING COUNT(order_id) > 1;

-- Order by
SELECT * FROM service_orders
ORDER BY service_date DESC;
