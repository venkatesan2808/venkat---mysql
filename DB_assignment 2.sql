use studentdb;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);


INSERT INTO customers (customer_name, city)
VALUES
('Ravi', 'Chennai'),
('Anu', 'Bangalore'),
('Kumar', 'Hyderabad'),
('Priya', 'Mumbai'),
('Arun', 'Delhi');



CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10,2),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

INSERT INTO orders (customer_id, product_name, quantity, price)
VALUES
(1, 'Laptop', 1, 50000),
(2, 'Mobile', 2, 20000),
(1, 'Mouse', 3, 500),
(3, 'Keyboard', 1, 1500),
(4, 'Monitor', 2, 12000);

-- inner join--
SELECT
    c.customer_name,
    o.product_name,
    o.quantity,
    o.price
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id;

-- left join--
SELECT
    c.customer_name,
    o.product_name,
    o.quantity,
    o.price
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;




