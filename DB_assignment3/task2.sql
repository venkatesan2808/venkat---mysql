/*
 Normalize a table with repeating groups into 2NF. 
 2. Show an example of 3NF using sample data." 
 3. Find the AVG() order price. 
 4. Group orders by product_name and show total sales. 
 5. Sort the grouped data by total sales descending.
 */
 
 use salesandservices;
 
 CREATE TABLE order_details_unf (
    order_id INT,
    customer_name VARCHAR(100),
    product1 VARCHAR(100),
    product2 VARCHAR(100),
    product3 VARCHAR(100)
);

INSERT INTO order_details_unf
VALUES
(1, 'Ravi', 'Laptop', 'Mouse', 'Keyboard'),
(2, 'Anu', 'Mobile', 'Charger', NULL);

-- covnert into 2nf --

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

INSERT INTO orders VALUES
(1, 'Ravi'),
(2, 'Anu');

CREATE TABLE order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO order_items (order_id, product_name, price, quantity)
VALUES
(1, 'Laptop', 50000, 1),
(1, 'Mouse', 500, 2),
(1, 'Keyboard', 1200, 1),
(2, 'Mobile', 25000, 1),
(2, 'Charger', 800, 1);

-- example of 3nf --

CREATE TABLE employee_old (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department_id INT,
    department_name VARCHAR(100)
);

-- convert into 3nf --

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);


INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

INSERT INTO employees VALUES
(101, 'Arun', 1),
(102, 'Priya', 2),
(103, 'Kumar', 3);


-- find avg() --
SELECT AVG(price) AS average_order_price
FROM order_items;

-- Group orders by product_name and show total sales--

SELECT
    product_name,
    SUM(price * quantity) AS total_sales
FROM order_items
GROUP BY product_name;


-- Sort grouped data by total sales descending --
SELECT
    product_name,
    SUM(price * quantity) AS total_sales
FROM order_items
GROUP BY product_name
ORDER BY total_sales DESC;


