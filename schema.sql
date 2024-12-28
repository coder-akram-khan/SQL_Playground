CREATE TABLE category (
    category_id SERIAL PRIMARY KEY, -- Use SERIAL instead of INTEGER PRIMARY KEY
    name VARCHAR(60),
    description TEXT,
    parent_category_id INTEGER,
    FOREIGN KEY (parent_category_id) REFERENCES category(category_id)
);

CREATE TABLE product (
    product_id SERIAL PRIMARY KEY, -- Use SERIAL instead of INTEGER PRIMARY KEY
    product_name VARCHAR(40),
    category_id INTEGER,
    quantity_per_unit INT,
    unit_price DECIMAL(10, 2),
    units_in_stock INT,
    discontinued BOOLEAN,
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY, -- Use SERIAL instead of INTEGER PRIMARY KEY
    contact_name VARCHAR(30),
    company_name VARCHAR(40),
    contact_email VARCHAR(128),
    address VARCHAR(120),
    city VARCHAR(30),
    country VARCHAR(30)
);

CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY, -- Use SERIAL instead of INTEGER PRIMARY KEY
    last_name VARCHAR(20),
    first_name VARCHAR(20),
    birth_date DATE,
    hire_date DATE,
    address VARCHAR(128),
    city VARCHAR(30),
    country VARCHAR(30),
    reports_to INTEGER,
    FOREIGN KEY (reports_to) REFERENCES employee(employee_id)
);

CREATE TABLE purchase (
    purchase_id SERIAL PRIMARY KEY, -- Use SERIAL instead of INTEGER PRIMARY KEY
    customer_id INTEGER,
    employee_id INTEGER,
    total_price DECIMAL(10, 2),
    purchase_date TIMESTAMP,
    shipped_date TIMESTAMP,
    ship_address VARCHAR(60),
    ship_city VARCHAR(15),
    ship_country VARCHAR(15),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE purchase_item (
    purchase_id INTEGER,
    product_id INTEGER,
    unit_price DECIMAL(10, 2),
    quantity INT,
    PRIMARY KEY (purchase_id, product_id),
    FOREIGN KEY (purchase_id) REFERENCES purchase(purchase_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);



-- Populating the category table (10 rows)
INSERT INTO category (category_id, name, description, parent_category_id) VALUES
(1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales', NULL),
(2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings', NULL),
(3, 'Confections', 'Desserts, candies, and sweet breads', NULL),
(4, 'Dairy Products', 'Cheese, milk, and other dairy items', NULL),
(5, 'Grains/Cereals', 'Breads, crackers, pasta, and cereal', NULL),
(6, 'Seafood', 'Seaweed and fish', NULL),
(7, 'Meat/Poultry', 'Prepared meats', NULL),
(8, 'Produce', 'Fresh fruits and vegetables', NULL),
(9, 'Snacks', 'Chips, popcorn, and snack foods', NULL),
(10, 'Baked Goods', 'Pastries and baked delicacies', NULL);

-- Populating the product table (30 rows)
INSERT INTO product (product_name, category_id, quantity_per_unit, unit_price, units_in_stock, discontinued) VALUES
('Chai', 1, 24, 18.00, 39, FALSE),
('Chang', 1, 24, 19.00, 17, FALSE),
('Aniseed Syrup', 2, 12, 10.00, 13, FALSE),
('Chef Anton''s Cajun Seasoning', 2, 48, 22.00, 53, FALSE), 
('Grandma''s Boysenberry Spread', 2, 12, 25.00, 120, FALSE),
('Uncle Bob''s Organic Dried Pears', 8, 12, 30.00, 15, FALSE),
('Mishi Kobe Niku', 7, 18, 97.00, 29, FALSE),
('Ikura', 6, 12, 31.00, 31, FALSE),
('Chocolate Biscuits', 3, 24, 12.00, 40, FALSE),
('Cheddar Cheese', 4, 10, 15.00, 25, FALSE),
('Pasta Fusilli', 5, 20, 8.50, 60, FALSE),
('Salmon Fillet', 6, 5, 22.00, 35, FALSE),
('Roast Chicken', 7, 8, 14.00, 50, FALSE),
('Strawberries', 8, 12, 6.00, 70, FALSE),
('Popcorn', 9, 6, 2.50, 80, FALSE),
('Croissant', 10, 10, 3.00, 45, FALSE),
('Latte', 1, 1, 5.00, 150, FALSE),
('Honey', 2, 1, 8.00, 100, FALSE),
('Dark Chocolate', 3, 5, 20.00, 55, FALSE),
('Milk', 4, 1, 1.50, 200, FALSE),
('Corn Flakes', 5, 12, 4.50, 120, FALSE),
('Tuna Can', 6, 1, 3.00, 150, FALSE),
('Sausage', 7, 4, 7.00, 90, FALSE),
('Bananas', 8, 10, 1.20, 300, FALSE),
('Potato Chips', 9, 8, 2.00, 200, FALSE),
('Bagel', 10, 5, 1.50, 120, FALSE),
('Espresso', 1, 1, 4.00, 100, FALSE),
('Soy Sauce', 2, 1, 2.50, 80, FALSE),
('Truffles', 3, 1, 15.00, 30, FALSE),
('Butter', 4, 1, 2.00, 150, FALSE);

-- Populating the customer table (20 rows)
INSERT INTO customer (customer_id, contact_name, company_name, contact_email, address, city, country) VALUES
(1, 'John Doe', 'Acme Inc.', 'john.doe@example.com', '123 Elm St', 'Springfield', 'USA'),
(2, 'Jane Smith', 'Tech Corp', 'jane.smith@example.com', '456 Oak Ave', 'Metropolis', 'USA'),
(3, 'Carlos Perez', 'Global Solutions', 'carlos.perez@example.com', '789 Pine Rd', 'Madrid', 'Spain'),
(4, 'Li Wei', 'Beijing Enterprises', 'li.wei@example.cn', '101 Bamboo Dr', 'Beijing', 'China'),
(5, 'Ahmed Khan', 'Middle East Trading', 'ahmed.khan@example.com', '202 Palm St', 'Dubai', 'UAE'),
(6, 'Fatima Ali', 'Africa Trading Co.', 'fatima.ali@example.com', '303 Olive Rd', 'Cairo', 'Egypt'),
(7, 'Hiro Tanaka', 'Nippon Goods', 'hiro.tanaka@example.jp', '404 Sakura Ln', 'Tokyo', 'Japan'),
(8, 'Laura Mueller', 'Europa Supplies', 'laura.mueller@example.de', '505 Linden St', 'Berlin', 'Germany'),
(9, 'Victor Ivanov', 'RusExport', 'victor.ivanov@example.ru', '606 Maple Dr', 'Moscow', 'Russia'),
(10, 'Chloe Brown', 'Down Under Goods', 'chloe.brown@example.au', '707 Kangaroo Rd', 'Sydney', 'Australia'),
(11, 'Oscar Martinez', 'LatAm Distributors', 'oscar.martinez@example.com', '808 Andes Ave', 'Lima', 'Peru'),
(12, 'Anika Patel', 'IndiaMart', 'anika.patel@example.in', '909 Lotus Blvd', 'Mumbai', 'India'),
(13, 'Jacob Green', 'UK Supplies Ltd.', 'jacob.green@example.co.uk', '1010 Thames St', 'London', 'UK'),
(14, 'Sophia Lopez', 'South America Goods', 'sophia.lopez@example.com', '1111 Rio Rd', 'Rio de Janeiro', 'Brazil'),
(15, 'Kim Yoon', 'Seoul Trade Co.', 'kim.yoon@example.kr', '1212 Han Rd', 'Seoul', 'South Korea'),
(16, 'Emily Davis', 'Canada Exports', 'emily.davis@example.ca', '1313 Maple Dr', 'Toronto', 'Canada'),
(17, 'William Adams', 'New Zealand Imports', 'william.adams@example.nz', '1414 Kiwi Rd', 'Auckland', 'New Zealand'),
(18, 'Natalia Fernandez', 'Caribbean Co.', 'natalia.fernandez@example.com', '1515 Beach Rd', 'San Juan', 'Puerto Rico'),
(19, 'George Lucas', 'Hollywood Goods', 'george.lucas@example.com', '1616 Sunset Blvd', 'Los Angeles', 'USA'),
(20, 'Sara Schmidt', 'Alpine Goods', 'sara.schmidt@example.at', '1717 Alpine St', 'Vienna', 'Austria');


INSERT INTO employee (employee_id, last_name, first_name, birth_date, hire_date, address, city, country, reports_to) VALUES
(1, 'Smith', 'John', '1980-01-15', '2010-06-01', '12 Maple St', 'New York', 'USA', NULL),
(2, 'Doe', 'Jane', '1985-05-20', '2012-09-15', '34 Birch Ln', 'Chicago', 'USA', 1),
(3, 'Brown', 'Charlie', '1990-07-25', '2015-11-23', '56 Cedar Ave', 'San Francisco', 'USA', 1),
(4, 'Garcia', 'Maria', '1992-03-30', '2018-04-10', '78 Walnut Blvd', 'Miami', 'USA', 2),
(5, 'Kim', 'Yoon', '1988-10-10', '2016-03-15', '98 River Rd', 'Seoul', 'South Korea', 3),
(6, 'Patel', 'Anika', '1983-12-12', '2011-01-01', '100 Garden St', 'Mumbai', 'India', 2),
(7, 'Tanaka', 'Hiro', '1975-04-04', '2005-05-20', '123 Sakura Ln', 'Tokyo', 'Japan', NULL),
(8, 'Ivanov', 'Victor', '1995-02-02', '2019-08-12', '456 Kremlin St', 'Moscow', 'Russia', 3),
(9, 'Lopez', 'Sophia', '1997-06-06', '2020-09-09', '789 Andes Rd', 'Lima', 'Peru', 4),
(10, 'Green', 'Jacob', '1987-03-03', '2014-07-07', '321 Thames St', 'London', 'UK', 5),
(11, 'Chen', 'Liang', '1982-11-11', '2009-03-10', '432 Willow St', 'Shanghai', 'China', NULL),
(12, 'Kumar', 'Raj', '1978-08-18', '2006-09-25', '567 Jasmine Rd', 'New Delhi', 'India', 6),
(13, 'Johnson', 'Liam', '1993-02-27', '2021-07-01', '789 Cypress Blvd', 'Houston', 'USA', 4),
(14, 'Perez', 'Carlos', '1989-04-15', '2017-11-20', '910 Cherry Ave', 'Mexico City', 'Mexico', 7),
(15, 'Nguyen', 'Thao', '1991-09-10', '2019-05-15', '342 Magnolia St', 'Hanoi', 'Vietnam', 8),
(16, 'Jones', 'Emma', '1984-06-22', '2013-04-05', '653 Pine Rd', 'Boston', 'USA', 9),
(17, 'Park', 'Min', '1990-12-05', '2020-08-30', '765 Redwood Ln', 'Busan', 'South Korea', 10),
(18, 'Alvarez', 'Isabella', '1986-03-19', '2014-02-10', '234 Birch Rd', 'Barcelona', 'Spain', 5),
(19, 'Moore', 'Ethan', '1994-11-14', '2022-01-15', '678 Aspen St', 'Denver', 'USA', 13),
(20, 'Singh', 'Arjun', '1977-07-07', '2004-06-30', '890 Spruce St', 'Toronto', 'Canada', 12);

INSERT INTO purchase (purchase_id, customer_id, employee_id, total_price, purchase_date, shipped_date, ship_address, ship_city, ship_country) VALUES
(1, 1, 2, 150.00, '2024-01-01 10:00:00', '2024-01-03 14:00:00', '123 Elm St', 'Springfield', 'USA'),
(2, 3, 4, 250.00, '2024-01-02 11:30:00', '2024-01-05 16:00:00', '789 Pine Rd', 'Madrid', 'Spain'),
(3, 5, 6, 300.00, '2024-01-03 12:15:00', '2024-01-07 10:30:00', '202 Palm St', 'Dubai', 'UAE'),
(4, 7, 8, 200.00, '2024-01-04 09:45:00', '2024-01-06 13:45:00', '404 Sakura Ln', 'Tokyo', 'Japan'),
(5, 9, 10, 180.00, '2024-01-05 14:20:00', '2024-01-09 11:15:00', '606 Maple Dr', 'Moscow', 'Russia'),
(6, 11, 12, 220.00, '2024-01-06 08:30:00', '2024-01-10 14:50:00', '808 Andes Ave', 'Lima', 'Peru'),
(7, 13, 14, 275.00, '2024-01-07 16:00:00', '2024-01-11 15:00:00', '1010 Thames St', 'London', 'UK'),
(8, 15, 16, 320.00, '2024-01-08 13:10:00', '2024-01-12 12:45:00', '1212 Han Rd', 'Seoul', 'South Korea'),
(9, 17, 18, 195.00, '2024-01-09 17:40:00', '2024-01-13 10:50:00', '1414 Kiwi Rd', 'Auckland', 'New Zealand'),
(10, 19, 20, 400.00, '2024-01-10 15:30:00', '2024-01-14 13:20:00', '1616 Sunset Blvd', 'Los Angeles', 'USA'),
(11, 2, 1, 145.00, '2024-01-11 11:00:00', '2024-01-15 12:00:00', '456 Oak Ave', 'Metropolis', 'USA'),
(12, 4, 3, 210.00, '2024-01-12 14:15:00', '2024-01-16 09:00:00', '101 Bamboo Dr', 'Beijing', 'China'),
(13, 6, 5, 330.00, '2024-01-13 10:10:00', '2024-01-17 11:45:00', '303 Olive Rd', 'Cairo', 'Egypt'),
(14, 8, 7, 275.00, '2024-01-14 13:25:00', '2024-01-18 14:30:00', '505 Linden St', 'Berlin', 'Germany'),
(15, 10, 9, 250.00, '2024-01-15 09:45:00', '2024-01-19 16:20:00', '707 Kangaroo Rd', 'Sydney', 'Australia'),
(16, 12, 11, 310.00, '2024-01-16 16:35:00', '2024-01-20 10:25:00', '909 Lotus Blvd', 'Mumbai', 'India'),
(17, 14, 13, 185.00, '2024-01-17 12:20:00', '2024-01-21 14:10:00', '1111 Rio Rd', 'Rio de Janeiro', 'Brazil'),
(18, 16, 15, 225.00, '2024-01-18 11:10:00', '2024-01-22 13:50:00', '1313 Maple Dr', 'Toronto', 'Canada'),
(19, 18, 17, 310.00, '2024-01-19 15:40:00', '2024-01-23 11:30:00', '1515 Beach Rd', 'San Juan', 'Puerto Rico'),
(20, 20, 19, 290.00, '2024-01-20 09:25:00', '2024-01-24 12:45:00', '1717 Alpine St', 'Vienna', 'Austria'),
(21, 1, 2, 275.00, '2024-01-21 14:50:00', '2024-01-25 10:15:00', '123 Elm St', 'Springfield', 'USA'),
(22, 3, 4, 360.00, '2024-01-22 16:20:00', '2024-01-26 14:00:00', '789 Pine Rd', 'Madrid', 'Spain'),
(23, 5, 6, 410.00, '2024-01-23 11:45:00', '2024-01-27 13:30:00', '202 Palm St', 'Dubai', 'UAE'),
(24, 7, 8, 245.00, '2024-01-24 10:10:00', '2024-01-28 12:00:00', '404 Sakura Ln', 'Tokyo', 'Japan'),
(25, 9, 10, 340.00, '2024-01-25 13:55:00', '2024-01-29 15:40:00', '606 Maple Dr', 'Moscow', 'Russia'),
(26, 11, 12, 285.00, '2024-01-26 09:15:00', '2024-01-30 14:20:00', '808 Andes Ave', 'Lima', 'Peru'),
(27, 13, 14, 370.00, '2024-01-27 12:40:00', '2024-01-31 10:30:00', '1010 Thames St', 'London', 'UK'),
(28, 15, 16, 295.00, '2024-01-28 15:20:00', '2024-02-01 13:15:00', '1212 Han Rd', 'Seoul', 'South Korea'),
(29, 17, 18, 265.00, '2024-01-29 11:00:00', '2024-02-02 12:50:00', '1414 Kiwi Rd', 'Auckland', 'New Zealand'),
(30, 19, 20, 405.00, '2024-01-30 14:05:00', '2024-02-03 14:35:00', '1616 Sunset Blvd', 'Los Angeles', 'USA'),
(31, 2, 1, 180.00, '2024-01-31 09:50:00', '2024-02-04 11:25:00', '456 Oak Ave', 'Metropolis', 'USA'),
(32, 4, 3, 215.00, '2024-02-01 10:30:00', '2024-02-05 15:45:00', '101 Bamboo Dr', 'Beijing', 'China'),
(33, 6, 5, 395.00, '2024-02-02 13:15:00', '2024-02-06 16:30:00', '303 Olive Rd', 'Cairo', 'Egypt'),
(34, 8, 7, 320.00, '2024-02-03 12:00:00', '2024-02-07 14:00:00', '505 Linden St', 'Berlin', 'Germany'),
(35, 10, 9, 275.00, '2024-02-04 15:30:00', '2024-02-08 12:10:00', '707 Kangaroo Rd', 'Sydney', 'Australia'),
(36, 12, 11, 290.00, '2024-02-05 09:20:00', '2024-02-09 11:50:00', '909 Lotus Blvd', 'Mumbai', 'India'),
(37, 14, 13, 310.00, '2024-02-06 14:50:00', '2024-02-10 12:40:00', '1111 Rio Rd', 'Rio de Janeiro', 'Brazil'),
(38, 16, 15, 245.00, '2024-02-07 11:35:00', '2024-02-11 10:20:00', '1313 Maple Dr', 'Toronto', 'Canada'),
(39, 18, 17, 400.00, '2024-02-08 16:45:00', '2024-02-12 14:25:00', '1515 Beach Rd', 'San Juan', 'Puerto Rico'),
(40, 20, 19, 275.00, '2024-02-09 13:10:00', '2024-02-13 15:15:00', '1717 Alpine St', 'Vienna', 'Austria');

-- Populating the purchase_item table
INSERT INTO purchase_item (purchase_id, product_id, unit_price, quantity) VALUES
(1, 1, 15.00, 10),
(1, 2, 20.00, 5),
(2, 3, 50.00, 2),
(2, 4, 25.00, 4),
(3, 5, 30.00, 3),
(3, 6, 60.00, 2),
(4, 7, 40.00, 5),
(4, 8, 35.00, 4),
(5, 9, 45.00, 2),
(5, 10, 90.00, 1),
(6, 11, 22.00, 7),
(6, 12, 15.00, 5),
(7, 13, 12.00, 9),
(7, 14, 18.00, 4),
(8, 15, 25.00, 6),
(8, 16, 40.00, 3),
(9, 17, 60.00, 2),
(9, 18, 20.00, 7),
(10, 19, 75.00, 3),
(10, 20, 15.00, 8),
(11, 21, 10.00, 10),
(11, 22, 12.00, 5),
(12, 23, 30.00, 4),
(12, 24, 50.00, 3),
(13, 25, 45.00, 6),
(13, 26, 20.00, 7),
(14, 27, 55.00, 2),
(14, 28, 35.00, 4),
(15, 29, 20.00, 8),
(15, 30, 40.00, 3),
(16, 1, 70.00, 2), 
(16, 2, 25.00, 6), 
(17, 3, 18.00, 9), 
(17, 4, 60.00, 2), 
(18, 5, 22.00, 7), 
(18, 6, 50.00, 2), 
(19, 7, 45.00, 5), 
(19, 8, 40.00, 3), 
(20, 9, 30.00, 6), 
(20, 10, 50.00, 3);






