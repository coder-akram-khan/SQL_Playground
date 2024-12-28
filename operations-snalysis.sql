-- Database Overview:

/*
Database Name: storedatabase

Purpose:

This database is designed to store and manage information related to products, customers, employees, purchases, and sales within a company. It captures key details such as product information, customer contact details, employee details, purchase history, and order items.

Tables:

    category:
        Stores information about product categories, including their names, descriptions, and parent-child relationships.

    product:
        Stores information about individual products, including their names, categories, unit prices, stock levels, and discontinuation status.

    customer:
        Stores information about customers, including their names, contact details, and company affiliations.

    employee:
        Stores information about employees, including their names, contact details, hire dates, and reporting relationships.

    purchase:
        Stores information about individual purchases, including the customer and employee involved, the total price, purchase date, and shipping details.

    purchase_item:
        Stores details about individual items within a purchase, including the product ID, unit price, and quantity.

Relationships:

    One-to-many:
        A category can have multiple sub-categories.
        A category can have multiple products.
        A customer can have multiple purchases.
        An employee can have multiple purchases.
        A purchase can have multiple purchase items.

    One-to-one:
        An employee can report to only one other employee (manager).

Primary Keys:

    category_id in category
    product_id in product
    customer_id in customer
    employee_id in employee
    purchase_id in purchase
    purchase_id and product_id (composite key) in purchase_item

Foreign Keys:

    parent_category_id in category references category_id in category
    category_id in product references category_id in category
    customer_id in purchase references customer_id in customer
    employee_id in purchase references employee_id in employee
    reports_to in employee references employee_id in employee
    purchase_id in purchase_item references purchase_id in purchase
    product_id in purchase_item references product_id in product

Data Types:

Appropriate data types are used for each attribute, such as INTEGER, VARCHAR, DATE, TIMESTAMP, DECIMAL, and BOOLEAN.

This database provides a structured framework for storing and managing sales-related information, enabling various analyses and reports to be generated.
*/

-- OPERATIONS
-- Display all data present in the product table:
SELECT * FROM product;

-- Display product names for products with 
-- a unit price greater than or equal to 3.5:
SELECT product_name 
FROM product
WHERE unit_price>=3.5;

-- Display data for all products in categories with an ID 
-- of 1 (Food) or 5 (Fruits and Vegetables) and with a unit price above 3.5.
SELECT * 
FROM product
WHERE (product_id = 1 OR category_id = 5)
AND unit_price>3.5;

-- Select product names along with their categories. 
-- Display two columns: product_name and category_name. 
SELECT 
	p.product_name, 
	c.name as category_name
FROM 
	product as p
JOIN 
	category as c
ON 
	p.category_id= c.category_id;


-- For each purchase, display the purchase ID, 
-- product name, unit price at the time of purchase, 
-- and quantity of each product's items.
SELECT 
    pr.purchase_id AS purchase_ID, 
    p.product_name, 
    pi.unit_price, 
    pr.purchase_date, 
    pi.quantity 
FROM 
    product AS p
JOIN 
    purchase_item AS pi ON p.product_id = pi.product_id
JOIN 
    purchase AS pr ON pr.purchase_id = pi.purchase_id;

-- For each purchase, display all product categories bought in this purchase.
-- Show each category only once for each purchase.
SELECT 
  pu.purchase_id,
  c.name AS category_name
FROM purchase AS pu
JOIN purchase_item AS pi ON pu.purchase_id = pi.purchase_id
JOIN product AS p ON p.product_id = pi.product_id
JOIN category AS c ON c.category_id = p.category_id
GROUP BY pu.purchase_id, c.category_id;

-- Display all categories' data. Sort the 
-- categories by name in ascending (A to Z) order.

SELECT * 
FROM category
ORDER BY name ASC;


-- Show employees’ last names, first names, and birthdates. 
-- Sort results by employee age in ascending order .

SELECT first_name, last_name, birth_date
FROM employee
ORDER BY birth_date DESC;


-- Display data for all products, sorting the results by the number of units
-- in descending order and product name in ascending order.
SELECT * FROM product 
ORDER BY units_in_stock DESC,product_name ASC;

-- For each product category, show its name and find the average unit price. 
-- Display two columns: name and average_unit_price.

SELECT c.name, AVG(p.unit_price) AS average_unit_price
FROM product AS p
JOIN category AS c ON p.category_id = c.category_id
GROUP BY c.name;

-- Count how many customers live in each city except for Knoxville and Stockton. 
-- Sort the results by the city name in ascending order. Display two columns: city 
-- and customers_quantity.

SELECT COUNT(customer_id), city 
FROM customer
WHERE city NOT IN ('Knoxville', 'Stockton')
GROUP BY city
ORDER BY city;

--For each category, find the number of discontinued products. Show only the categories 
--with at least three discontinued products. Sort the rows by the number of discontinued 
--products in descending order. Display two columns: name (the name of the category) and 
--discontinued_products_number.
SELECT c.name, COUNT(*) AS discontinued_products_number
FROM product AS p
JOIN category AS c ON c.category_id = p.category_id
WHERE p.discontinued = TRUE  
GROUP BY c.name
HAVING COUNT(*) >= 3  
ORDER BY discontinued_products_number DESC;

-- Display the last and first names of employees with an unknown hire date.

SELECT last_name, first_name
FROM employee
WHERE hire_date IS NULL;












































