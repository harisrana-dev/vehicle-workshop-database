-- Customers
INSERT INTO customers VALUES
(1, 'ali khan', '03001234567', 'lahore', 'ali@gmail.com'),
(2, 'ahmed raza', '03111234567', 'karachi', 'ahmed@gmail.com');

-- Vehicles
INSERT INTO vehicles VALUES
(1, 1, 'toyota', 'corolla', 2020, 'lea-1234', 'car'),
(2, 1, 'honda', 'civic', 2019, 'lea-5678', 'car'),
(3, 2, 'suzuki', 'alto', 2021, 'khi-9999', 'car');

-- Mechanics
INSERT INTO mechanics VALUES
(1, 'usman', '03221234567', 'engine'),
(2, 'bilal', '03331234567', 'electrical');

-- Services
INSERT INTO services VALUES
(1, 'oil change', 'engine oil replacement', 3000),
(2, 'brake service', 'brake inspection and repair', 5000),
(3, 'wheel alignment', 'wheel balancing', 4000);

-- Service Orders
INSERT INTO service_orders VALUES
(101, 1, 1, '2025-01-01', 'completed', 'no issues'),
(102, 2, 2, '2025-01-02', 'pending', 'check brakes');

-- Service Items
INSERT INTO service_items VALUES
(1, 101, 1, 1, 3000),
(2, 101, 3, 1, 4000),
(3, 102, 2, 1, 5000);

-- Payments
INSERT INTO payments VALUES
(1, 101, 7000, '2025-01-01', 'cash');
